# Garbage Collection
## fixed statement
[fixed statement - C# reference | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/statements/fixed)

```csharp
byte[] array = { 1, 2, 3 };
fixed (byte* pointer = array) {
    // ...
}
```

```csharp
byte[] array = { 1, 2, 3 };

GCHandle handle = GCHandle.Alloc(array, GCHandleType.Pinned);
IntPtr intPointer = pinnedArray.AddrOfPinnedObject();
byte* pointer = (byte*)intPointer.ToPointer();

// ...

handle.Free();
```

[c# - `fixed` vs GCHandle.Alloc(obj, GCHandleType.Pinned) - Stack Overflow](https://stackoverflow.com/questions/22201007/fixed-vs-gchandle-allocobj-gchandletype-pinned)