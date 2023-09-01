# Disposal
[Cleaning up unmanaged resources - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/garbage-collection/unmanaged)

Disposal differs from garbage collection in that disposal is usually explicitly instigated; garbage collection is totally automatic. In other words, the programmer takes care of such things as releasing file handles, locks, and operating system resources, while the CLR takes care of releasing memory.[^nutshell] The GC does not dispose your objects, as it has no knowledge of `IDisposable.Dispose()` or `IAsyncDisposable.DisposeAsync()`. The GC only knows whether an object is finalizable (that is, it defines an `Object.Finalize() `method), and when the object's finalizer needs to be called. 

.NET follows a de facto set of rules in its disposal logic. These rules are not hardwired to .NET or the C# language in any way; their purpose is to define a consistent protocol to consumers. Here they are[^nutshell]:
1. After an object has been disposed, it’s beyond redemption. It cannot be reactivated, and calling its methods or properties (other than Dispose) throws an `ObjectDisposedException`.
2. Calling an object’s Dispose method repeatedly causes no error.
3. If disposable object $x$ “owns” disposable object $y$, $x$’s Dispose method automatically calls $y$’s Dispose method—unless instructed otherwise.

```csharp
public interface IDisposable 
{ 
  void Dispose(); 
}
```

[c# - What is the right way to make sure Dispose is called on class member/field? - Stack Overflow](https://stackoverflow.com/questions/10711785/what-is-the-right-way-to-make-sure-dispose-is-called-on-class-member-field)

> An object or piece of code is said to "own" an `IDisposable` if it holds a reference, and there is no reason to believe that any other object or piece of code will call `Dispose` on it. Code which owns an an `IDisposable` held in a local variable must generally, before abandoning that variable, either call `Dispose` on it or else hand it off to some other code or object that expects to receive ownership. An object which owns `IDisposable` stored in a field must generally implement `IDisposable` itself; its `Dispose` method should check if the field is null and, if not, call `Dispose` on it.
> 
> Objects should override `Finalize` only if they would could perform some cleanup in a fashion that would be both useful and safe in an unknown threading context. In general, an object should not call `Dispose` on other `IDisposable` objects within a `Finalize` method, because although (contrary to what some sources claim) such objects are guaranteed to exist, one of the following conditions will most likely apply:
> 1. The other object may still be in use somewhere, in which case calling `Dispose` on it would be unsafe.
> 2. The other object may have already had its `Finalize` method called, in which case `Dispose` would be at best redundant, and may be unsafe.
> 3. The other object may already be scheduled to have its `Finalize` method run, in which case `Dispose` might be safe, but would likely be redundant.
> 4. The other object might not support thread-safe cleanup, in which case calling `Dispose` might not be redundant, but would be unsafe.
> 5. By the time the `Finalizer` could actually become eligible to run, anything that it might want to do might be moot (this scenario can come up with event subscriptions).
>
> In short, if one owns an `IDisposable`, one should generally figure that if it can safely be cleaned up within a finalizer thread context, it will take care of itself, and if it can't, one shouldn't try to force it.

## WPF
[.net - Do WPF Windows Dispose() their DataContexts? - Stack Overflow](https://stackoverflow.com/questions/29749892/do-wpf-windows-dispose-their-datacontexts)
- `Closed`

[c# - Disposing WPF User Controls - Stack Overflow](https://stackoverflow.com/questions/502761/disposing-wpf-user-controls)
- [Dispatcher.ShutdownStarted](https://learn.microsoft.com/en-us/dotnet/api/system.windows.threading.dispatcher.shutdownstarted)


[^nutshell]: C# in a Nutshell