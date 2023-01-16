# Assembly Loading
**Load contexts** are logical buckets within an application domain that hold assemblies. Load contexts help ensure load-order independence while loading assemblies. In addition, they provide a measure of isolation to assemblies and their dependencies when they are loaded into different contexts.

Within an application domain, assemblies can be loaded into one of three contexts, or they can be loaded without context:
- The **default load context** contains assemblies found by probing the global assembly cache, the host assembly store if the runtime is hosted (for example, in SQL Server), and the [ApplicationBase](https://learn.microsoft.com/en-us/dotnet/api/system.appdomainsetup.applicationbase) and [PrivateBinPath](https://learn.microsoft.com/en-us/dotnet/api/system.appdomainsetup.privatebinpath) of the application domain. Most overloads of the [Load](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.load) method load assemblies into this context.
- The **load-from context** contains assemblies that are loaded from locations that are not searched by the loader. For example, add-ins might be installed in a directory that is not under the application path. [Assembly.LoadFrom](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.loadfrom), [AppDomain.CreateInstanceFrom](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.createinstancefrom), and [AppDomain.ExecuteAssembly](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.executeassembly) are examples of methods that load by path.
- The **reflection-only context** contains assemblies loaded with the [ReflectionOnlyLoad](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.reflectiononlyload) and [ReflectionOnlyLoadFrom](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.reflectiononlyloadfrom) methods. Code in this context cannot be executed.
- If you generated a transient dynamic assembly by using reflection emit, the assembly is not in any context. In addition, most assemblies that are loaded by using the [LoadFile](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.loadfile) method are loaded without context, and assemblies that are loaded from byte arrays are loaded without context unless their identity (after policy is applied) establishes that they are in the global assembly cache.

See [Best Practices for Assembly Loading - .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/deployment/best-practices-for-assembly-loading) and [Understanding The CLR Binder | Microsoft Learn](https://learn.microsoft.com/en-us/archive/msdn-magazine/2009/may/understanding-the-clr-binder#id0400031) for details.

## Default load context
When the JIT compiler compiles the Intermediate Language (IL) for a method, it sees what types are referenced in the IL code. Then at run time, the JIT compiler uses the assembly’s TypeRef and AssemblyRef metadata tables to determine what assembly defines the type being referenced. The AssemblyRef metadata table entry contains all of the parts that make up the strong name of the assembly. The JIT compiler grabs all of these parts—name (without extension or path), version, culture, and public key token—concatenates them into a string, and then attempts to load an assembly matching this identity into the AppDomain (assuming that it’s not already loaded). If the assembly being loaded is weakly named, the identity is just the name of the assembly (no version, culture, or public key token information).[^clrvia]

Internally, the CLR attempts to load this assembly by using the `System.Reflection.Assembly` class’s static [Load](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.load?view=netframework-4.8) method. Load causes the CLR to apply a version-binding redirection policy to the assembly and looks for the assembly in:
1. The global assembly cache (GAC)
2. The application’s base directory (AppDomain.BaseDirectory)
3. Private path subdirectories
4. Codebase locations

If you call Load by passing a weakly named assembly, Load doesn’t apply a version-binding redirection policy to the assembly, and the CLR won’t look in the GAC for the assembly.[^clrvia] See [How the Runtime Locates Assemblies - .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies) for details.

Load 似乎只会检查 default load context 中的 assemblies，不会使用其它 context 中加载的 assemblies。这意味着 [AppDomain.CreateInstance()](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.createinstance) 将无法创建其它 context 中的 assemblies 的类，而只能通过 [Assembly.CreateInstance()](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.createinstance) 创建。

.NET provides the [AppDomain.AssemblyResolve](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.assemblyresolve) event for applications that require greater control over assembly loading. By handling this event, your application can load an assembly into the load context from outside the normal probing paths, select which of several assembly versions to load, emit a dynamic assembly and return it, and so on. See [Resolve assembly loads | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/assembly/resolve-loads) for details.

## No context
Loading assemblies without context has the following disadvantages:
- Other assemblies cannot bind to assemblies that are loaded without context, unless you handle the [AppDomain.AssemblyResolve](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.assemblyresolve) event.
- Dependencies are not loaded automatically. You can preload them without context, preload them into the default load context, or load them by handling the [AppDomain.AssemblyResolve](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.assemblyresolve) event.
- Loading multiple assemblies with the same identity without context can cause type identity problems similar to those caused by loading assemblies with the same identity into multiple contexts. See [Avoid Loading an Assembly into Multiple Contexts](https://learn.microsoft.com/en-us/dotnet/framework/deployment/best-practices-for-assembly-loading#avoid_loading_into_multiple_contexts).
- If a native image exists for the assembly, it is not used.
- The assembly cannot be loaded as domain-neutral.


[^clrvia]: CLR via C#