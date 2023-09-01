# Finalizers
Prior to an object being released from memory, its **finalizer** runs, if it has one.

```csharp
class Test 
{ 
  ˜Test() 
  { 
    // Finalizer logic... 
  } 
}
```

Finalizers are possible because garbage collection works in distinct phases. First, the GC identifies the unused objects ripe for deletion. Those without finalizers are deleted immediately. Those with pending (unrun) finalizers are kept alive (for now) and are put onto a special queue. At that point, garbage collection is complete, and your program continues executing. The **finalizer thread** then kicks in and starts running in parallel to your program, picking objects off that special queue and running their finalization methods. Prior to each object’s finalizer running, it’s still very much alive—that queue acts as a root object. After it’s been dequeued and the finalizer executed, the object becomes orphaned and will be deleted in the next collection (for that object’s generation).[^nutshell]

## Calling Dispose from a Finalizer
A popular pattern is to have the finalizer call **Dispose**. This makes sense when cleanup is not urgent and hastening it by calling Dispose is more of an optimization than a necessity.[^nutshell]

```csharp
class Test : IDisposable 
{ 
  public void Dispose()             // NOT virtual 
  { 
    Dispose (true); 
    GC.SuppressFinalize (this);     // Prevent finalizer from running. 
  } 
 
  protected virtual void Dispose (bool disposing) 
  { 
    if (disposing) 
    { 
      // Call Dispose() on other objects owned by this instance. 
      // You can reference other finalizable objects here. 
      // ... 
    } 
 
    // Release unmanaged resources owned by (just) this object. 
    // ... 
  } 
 
  ~Test() => Dispose (false); 
}
```


[^nutshell]: C# in a Nutshell