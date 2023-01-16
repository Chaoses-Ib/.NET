# Application Domains
[^clrvia]

An **application domain** is a logical container for a set of assemblies. Application domains allow third-party untrusted code to run in an existing process, and the CLR guarantees that the data structures, code, and security context will not be exploited or compromised.

The CLR doesn’t support the ability to unload a single assembly from an AppDomain. However, you can tell the CLR to unload an AppDomain, which will cause all of the assemblies currently contained in it to be unloaded as well.

```csharp
// Get a reference to the AppDomain that the calling thread is executing in 
// Or System.AppDomain.CurrentDomain
AppDomain adCallingThreadDomain = Thread.GetDomain(); 

// Every AppDomain is assigned a friendly string name (helpful for debugging) 
// Get this AppDomain's friendly string name and display it 
String callingDomainName = adCallingThreadDomain.FriendlyName; 
Console.WriteLine("Default AppDomain's friendly name={0}", callingDomainName); 

// Get and display the assembly in our AppDomain that contains the 'Main' method 
String exeAssembly = Assembly.GetEntryAssembly().FullName; 
Console.WriteLine("Main assembly={0}", exeAssembly); 

// Define a local variable that can refer to an AppDomain 
AppDomain ad2 = null; 
```
```
Default AppDomain's friendly name= Ch22­1­AppDomains.exe 
Main assembly=Ch22­1­AppDomains, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null 
```

## Cross­-AppDomain communication using marshal-­by­-reference
```csharp
// Create new AppDomain (security and configuration match current AppDomain) 
ad2 = AppDomain.CreateDomain("AD #2", null, null); 
MarshalByRefType mbrt = null; 

// Load our assembly into the new AppDomain, construct an object, marshal  
// it back to our AD (we really get a reference to a proxy) 
mbrt = (MarshalByRefType) 
  ad2.CreateInstanceAndUnwrap(exeAssembly, "MarshalByRefType"); 

Console.WriteLine("Type={0}", mbrt.GetType());  // The CLR lies about the type 

// Prove that we got a reference to a proxy object 
Console.WriteLine("Is proxy={0}", RemotingServices.IsTransparentProxy(mbrt)); 

// This looks like we're calling a method on MarshalByRefType but we're not. 
// We're calling a method on the proxy type. The proxy transitions the thread 
// to the AppDomain owning the object and calls this method on the real object. 
mbrt.SomeMethod(); 

// Unload the new AppDomain 
AppDomain.Unload(ad2); 
// mbrt refers to a valid proxy object; the proxy object refers to an invalid AppDomain

try { 
  // We're calling a method on the proxy type. The AD is invalid, exception is thrown
  mbrt.SomeMethod(); 
  Console.WriteLine("Successful call."); 
} 
catch (AppDomainUnloadedException) { 
  Console.WriteLine("Failed call."); 
} 

// Instances can be marshaled­by­reference across AppDomain boundaries 
public sealed class MarshalByRefType : MarshalByRefObject { 
   public MarshalByRefType() { 
      Console.WriteLine("{0} ctor running in {1}", 
         this.GetType().ToString(), Thread.GetDomain().FriendlyName); 
   } 
 
   public void SomeMethod() { 
      Console.WriteLine("Executing in " + Thread.GetDomain().FriendlyName); 
   } 
} 
```
```
MarshalByRefType ctor running in AD #2 
Type=MarshalByRefType 
Is proxy=True 
Executing in AD #2 
Failed call. 
```

When a source AppDomain wants to send or return the reference of a [MarshalByRefObject](https://learn.microsoft.com/en-us/dotnet/api/system.marshalbyrefobject?view=netframework-4.8) to a destination AppDomain, the CLR defines a proxy type in the destination AppDomain’s loader heap. This proxy type is defined using the original type’s metadata, and therefore, it looks exactly like the original type; it has all of the same instance members. This new type does have some instance fields defined inside of it, but these fields are not identical to that of the original data type. Instead, these fields indicate which AppDomain “owns” the real object and how to find the real object in the owning AppDomain.

After this type is defined in the destination AppDomain, [CreateInstanceAndUnwrap](https://learn.microsoft.com/en-us/dotnet/api/system.appdomain.createinstanceandunwrap?view=netframework-4.8) creates an instance of this proxy type, initializes its fields to identify the source AppDomain and the real object, and returns a reference to this proxy object to the destination AppDomain.

Obviously, accessing objects across AppDomain boundaries by using marshal-by-reference semantics has some performance costs associated with it, so you typically want to keep the use of this feature to a minimum.

Static members of a type derived from `MarshalByRefObject` are always accessed in the context of the calling AppDomain. Having a type’s static members execute in one AppDomain while instance members execute in another AppDomain would make a very awkward programming model.

The CLR uses a **lease manager**. When a proxy for an object is created, the CLR keeps the object alive for five minutes. If no calls have been made through the proxy after five minutes, then the object is deactivated and will have its memory freed at the next garbage collection. After each call into the object, the lease manager renews the object’s lease so that it is guaranteed to remain in memory for another two minutes before being deactivated. It is possible to override the default lease times of five minutes and two minutes by overriding `MarshalByRefObject`’s virtual [InitializeLifetimeService](https://learn.microsoft.com/en-us/dotnet/api/system.marshalbyrefobject.initializelifetimeservice?view=netframework-4.8) method.

## Cross­-AppDomain communication using marsha-­by-­value
```csharp
// Create new AppDomain (security and configuration match current AppDomain) 
ad2 = AppDomain.CreateDomain("AD #2", null, null); 

// Load our assembly into the new AppDomain, construct an object, marshal  
// it back to our AD (we really get a reference to a proxy) 
mbrt = (MarshalByRefType) 
  ad2.CreateInstanceAndUnwrap(exeAssembly, "MarshalByRefType"); 

// The object's method returns a COPY of the returned object;  
// the object is marshaled by value (not by reference). 
MarshalByValType mbvt = mbrt.MethodWithReturn(); 

// Prove that we did NOT get a reference to a proxy object 
Console.WriteLine("Is proxy={0}", RemotingServices.IsTransparentProxy(mbvt)); 

// This looks like we're calling a method on MarshalByValType and we are. 
Console.WriteLine("Returned object created " + mbvt.ToString()); 

// Unload the new AppDomain 
AppDomain.Unload(ad2); 
// mbvt refers to valid object; unloading the AppDomain has no impact. 

try { 
  // We're calling a method on an object; no exception is thrown 
  Console.WriteLine("Returned object created " + mbvt.ToString()); 
  Console.WriteLine("Successful call."); 
} 
catch (AppDomainUnloadedException) { 
  Console.WriteLine("Failed call."); 
} 

// Instances can be marshaled­by­reference across AppDomain boundaries 
public sealed class MarshalByRefType : MarshalByRefObject { 
   public MarshalByRefType() { 
      Console.WriteLine("{0} ctor running in {1}", 
         this.GetType().ToString(), Thread.GetDomain().FriendlyName); 
   } 
 
   public MarshalByValType MethodWithReturn() { 
      Console.WriteLine("Executing in " + Thread.GetDomain().FriendlyName); 
      MarshalByValType t = new MarshalByValType(); 
      return t; 
   } 
} 

// Instances can be marshaled­by­value across AppDomain boundaries 
[Serializable] 
public sealed class MarshalByValType : Object { 
   private DateTime m_creationTime = DateTime.Now; // NOTE: DateTime is [Serializable] 
 
   public MarshalByValType() { 
      Console.WriteLine("{0} ctor running in {1}, Created on {2:D}", 
         this.GetType().ToString(), 
         Thread.GetDomain().FriendlyName, 
         m_creationTime); 
   } 
 
   public override String ToString() { 
      return m_creationTime.ToLongDateString(); 
   } 
} 
```
```
MarshalByRefType ctor running in AD #2 
Executing in AD #2 
MarshalByValType ctor running in AD #2, Created on Friday, August 07, 2009 
Is proxy=False 
Returned object created Saturday, June 23, 2012 
Returned object created Saturday, June 23, 2012 
Successful call. 
```

When a source AppDomain wants to send or return a reference to an object to a destination AppDomain, the CLR serializes the object’s instance fields into a byte array. This byte array is copied from the source AppDomain to the destination AppDomain. Then, the CLR deserializes the byte array in the destination AppDomain. This forces the CLR to load the assembly that defines the type being deserialized into the destination AppDomain if it is not already loaded. Then, the CLR creates an instance of the type and uses the values in the byte array to initialize the object’s fields so that they have values identical to those they had in the original object.

## Cross­-AppDomain communication using non-marshalable types
```csharp
// Create new AppDomain (security and configuration match current AppDomain) 
ad2 = AppDomain.CreateDomain("AD #2", null, null); 

// Load our assembly into the new AppDomain, construct an object, marshal  
// it back to our AD (we really get a reference to a proxy) 
mbrt = (MarshalByRefType) 
  ad2.CreateInstanceAndUnwrap(exeAssembly, "MarshalByRefType"); 

// The object's method returns a non­marshalable object; exception 
NonMarshalableType nmt = mbrt.MethodArgAndReturn(callingDomainName); 
// We won't get here... 
 
// Instances can be marshaled­by­reference across AppDomain boundaries 
public sealed class MarshalByRefType : MarshalByRefObject { 
   public MarshalByRefType() { 
      Console.WriteLine("{0} ctor running in {1}", 
         this.GetType().ToString(), Thread.GetDomain().FriendlyName); 
   } 
 
   public NonMarshalableType MethodArgAndReturn(String callingDomainName) { 
      // NOTE: callingDomainName is [Serializable] 
      Console.WriteLine("Calling from '{0}' to '{1}'.", 
         callingDomainName, Thread.GetDomain().FriendlyName); 
      NonMarshalableType t = new NonMarshalableType(); 
      return t; 
   } 
} 

// Instances cannot be marshaled across AppDomain boundaries 
// [Serializable] 
public sealed class NonMarshalableType : Object { 
   public NonMarshalableType() { 
      Console.WriteLine("Executing in " + Thread.GetDomain().FriendlyName); 
   } 
}
```
```
MarshalByRefType ctor running in AD #2 
Calling from 'Ch22­1­AppDomains.exe' to 'AD #2'. 
Executing in AD #2 
 
Unhandled Exception: System.Runtime.Serialization.SerializationException:  
Type 'NonMarshalableType' in assembly 'Ch22­1­AppDomains, Version=0.0.0.0,  
Culture=neutral, PublicKeyToken=null' is not marked as serializable. 
at MarshalByRefType.MethodArgAndReturn(String callingDomainName) 
at Program.Marshalling() 
at Program.Main()  
```


[^clrvia]: CLR via C#