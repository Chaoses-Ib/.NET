# Security
[Exploring the .NET Framework 4 Security Model](https://learn.microsoft.com/en-us/archive/msdn-magazine/2009/november/exploring-the-net-framework-4-security-model)
- Evidence
- Policy
- Sandboxing
- Enforcement

## [ApplicationTrust](https://learn.microsoft.com/en-us/dotnet/api/system.security.policy.applicationtrust?view=netframework-4.8)
AppDomain 只能将 strong-named assemblies 加入 [FullTrustAssemblies](https://learn.microsoft.com/en-us/dotnet/api/system.security.policy.applicationtrust.fulltrustassemblies?view=netframework-4.8)，但 strong-named assemblies 又只能引用 strong-named assemblies，在项目依赖关系复杂时实现起来会很麻烦。

如果限制权限又不使用 FullTrustAssemblies，由于修改 AppDomain.AssemblyResolve 是 [SecurityCritical](https://learn.microsoft.com/en-us/dotnet/api/system.security.securitycriticalattribute?view=netframework-4.8) 的，assemblies 的加载会受到很大限制。

使用 `domain.CreateInstanceFrom()` 创建 FullTrustAssemblies 中的类的实例时会要求 Unrestricted 权限：
```
System.Security.SecurityException
  HResult=0x8013150A
  Message=请求失败。
  Source=mscorlib
  StackTrace:
   at System.AppDomain.CreateInstanceFromAndUnwrap(String assemblyName, String typeName)
   at ...

  m_demanded:
   <PermissionSet class="System.Security.PermissionSet"
   version="1"
   Unrestricted="true"/>
```
而使用 `Activator.CreateInstanceFrom()` 创建实例则不存在该问题[^CreateInstance-Unrestricted]。

## Permissions
程序的当前权限不是由 assembly 的身份决定的，而是通过调用栈逐级传递的。默认情况下，随着调用栈的加深，权限只会减少而不会增加，除非调用了 [CodeAccessPermission.Assert()](https://learn.microsoft.com/en-us/dotnet/api/system.security.codeaccesspermission.assert?view=netframework-4.8) 或声明了 [SecurityAttribute](https://learn.microsoft.com/en-us/dotnet/api/system.security.permissions.securityattribute?view=netframework-4.8)。See [Using the Assert Method | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/dotnet/framework/code-access-security/using-the-assert-method) for details.

注意事项：
- Assert 并不保证能够获取权限，检查权限需要使用 Demand。
- MarshalByRefObject 在切换 AppDomain 时不会刷新权限。
- delegate 会保存创建时的权限，在与 Dispatcher 并用时调试起来会很困难。

通过 `AppDomain.CurrentDomain.PermissionSet.ToString()` 可以查看当前权限集。

当出现 `TypeInitializationException` 时：
```
System.TypeInitializationException
  HResult=0x80131534
  Message=“Microsoft.CSharp.RuntimeBinder.SymbolTable”的类型初始值设定项引发异常。
  Source=mscorlib
  StackTrace:
   at System.Runtime.Remoting.Proxies.RealProxy.HandleReturnMessage(IMessage reqMsg, IMessage retMsg)
   at System.Runtime.Remoting.Proxies.RealProxy.PrivateInvoke(MessageData& msgData, Int32 type)
   at ...

Inner Exception 1:
MethodAccessException: 方法“Microsoft.CSharp.RuntimeBinder.SymbolTable.GetIsInvokableDelegate()”尝试访问方法“System.Reflection.MethodBase.get_IsDynamicallyInvokable()”失败。
```
需要添加 `ReflectionPermission(PermissionState.Unrestricted)`。

## [Reflection emit](https://learn.microsoft.com/en-us/dotnet/framework/reflection-and-codedom/security-issues-in-reflection-emit#Anonymously_Hosted_Dynamic_Methods)
`AssemblyBuilder.DefineDynamicAssembly()`、`ModuleBuilder.DefineType()` 和 `TypeBuilder.DefineMethod()`（以及 `Activator.CreateInstance()`）似乎都不会捕获创建时的安全上下文，或者说是不允许创建的方法使用常规方法提升权限，而只能通过 [AddDeclarativeSecurity()](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.emit.typebuilder.adddeclarativesecurity?view=netframework-4.8.1) 来添加权限，否则便会触发 SecurityException：

```
System.Security.SecurityException
  HResult=0x8013150A
  Message=The demand failed due to the code access security information captured during the creation of an anonymously hosted dynamic method. In order for this operation to succeed, ensure that the demand would have succeeded at the time the method was created. See http://go.microsoft.com/fwlink/?LinkId=288746 for more information.
  Source=mscorlib
  StackTrace:
   at System.Security.CodeAccessSecurityEngine.Check(Object demand, StackCrawlMark& stackMark, Boolean isPermSet)
   at System.Security.CodeAccessSecurityEngine.Check(CodeAccessPermission cap, StackCrawlMark& stackMark)
   at System.Security.CodeAccessPermission.Demand()
   at ...

  This exception was originally thrown at this call stack:
    System.Security.CodeAccessSecurityEngine.ThrowSecurityException(System.Reflection.RuntimeAssembly, System.Security.PermissionSet, System.Security.PermissionSet, System.RuntimeMethodHandleInternal, System.Security.Permissions.SecurityAction, object, System.Security.IPermission)
    System.Security.CodeAccessSecurityEngine.ThrowSecurityException(object, System.Security.PermissionSet, System.Security.PermissionSet, System.RuntimeMethodHandleInternal, System.Security.Permissions.SecurityAction, object, System.Security.IPermission)
    System.Security.CodeAccessSecurityEngine.CheckHelper(System.Security.PermissionSet, System.Security.PermissionSet, System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal, object, System.Security.Permissions.SecurityAction, bool)
    System.Security.PermissionSetTriple.CheckDemand(System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)
    System.Security.PermissionListSet.CheckDemand(System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)
    System.Security.SecurityRuntime.CheckDynamicMethodHelper(System.Reflection.Emit.DynamicResolver, System.Security.IPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)

Inner Exception 1:
SecurityException: Request for the permission of type 'System.Security.Permissions.SecurityPermission, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089' failed.
```
<details><summary>Chinese</summary>

```
System.Security.SecurityException
  HResult=0x8013150A
  Message=创建匿名承载的动态方法过程中获得的代码访问安全信息导致此请求失败。为使此操作成功，请确保在创建方法时可成功完成此请求。请参阅 http://go.microsoft.com/fwlink/?LinkId=288746 了解更多信息。
  Source=mscorlib
  StackTrace:
   at System.Security.CodeAccessSecurityEngine.Check(Object demand, StackCrawlMark& stackMark, Boolean isPermSet)
   at System.Security.CodeAccessSecurityEngine.Check(CodeAccessPermission cap, StackCrawlMark& stackMark)
   at System.Security.CodeAccessPermission.Demand()
   at ...

  This exception was originally thrown at this call stack:
    System.Security.CodeAccessSecurityEngine.ThrowSecurityException(System.Reflection.RuntimeAssembly, System.Security.PermissionSet, System.Security.PermissionSet, System.RuntimeMethodHandleInternal, System.Security.Permissions.SecurityAction, object, System.Security.IPermission)
    System.Security.CodeAccessSecurityEngine.ThrowSecurityException(object, System.Security.PermissionSet, System.Security.PermissionSet, System.RuntimeMethodHandleInternal, System.Security.Permissions.SecurityAction, object, System.Security.IPermission)
    System.Security.CodeAccessSecurityEngine.CheckHelper(System.Security.PermissionSet, System.Security.PermissionSet, System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal, object, System.Security.Permissions.SecurityAction, bool)
    System.Security.PermissionSetTriple.CheckDemand(System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)
    System.Security.PermissionListSet.CheckDemand(System.Security.CodeAccessPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)
    System.Security.SecurityRuntime.CheckDynamicMethodHelper(System.Reflection.Emit.DynamicResolver, System.Security.IPermission, System.Security.PermissionToken, System.RuntimeMethodHandleInternal)

Inner Exception 1:
SecurityException: 请求“System.Security.Permissions.SecurityPermission, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089”类型的权限已失败。
```

</details>

[^CreateInstance-Unrestricted]: [c# - The demand was for: <PermissionSet class="System.Security.PermissionSet" version="1" Unrestricted="true"/> - Stack Overflow](https://stackoverflow.com/questions/20957089/the-demand-was-for-permissionset-class-system-security-permissionset-version)