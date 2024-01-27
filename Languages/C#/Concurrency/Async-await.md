# Async/await
- Use `.GetAwaiter().GetResult()` instead of `.Result` or `.Wait()`
  - Both `.Result` and `.Wait()` will lock-up the current thread. If the current thread is the Main Thread (also known as the UI Thread), your UI will freeze until the `Task` has completed.
  - `.Result` or `.Wait()` rethrow your exception as a `System.AggregateException`, which makes it difficult to find the actual exception.

[Async/Await - Best Practices in Asynchronous Programming | Microsoft Learn](https://learn.microsoft.com/en-us/archive/msdn-magazine/2013/march/async-await-best-practices-in-asynchronous-programming)

[AsyncAwaitBestPractices: Extensions for System.Threading.Tasks.Task and System.Threading.Tasks.ValueTask](https://github.com/brminnick/AsyncAwaitBestPractices)

## `SynchronizationContext`
[Understanding Synchronization Context Task.ConfigureAwait In Action](https://www.c-sharpcorner.com/article/understanding-synchronization-context-task-configureawait-in-action/)

![](https://www.c-sharpcorner.com/article/understanding-synchronization-context-task-configureawait-in-action/Images/Understanding%20Synchronization1.png)

[c# - What does SynchronizationContext do? - Stack Overflow](https://stackoverflow.com/questions/18097471/what-does-synchronizationcontext-do)

### `ConfigureAwait()`
[ConfigureAwait in .NET 8](https://blog.stephencleary.com/2023/11/configureawait-in-net-8.html)

These all do the same thing:
```csharp
await task;
await task.ConfigureAwait(continueOnCapturedContext: true);
await task.ConfigureAwait(ConfigureAwaitOptions.ContinueOnCapturedContext);
```

## Fire-and-forget
在 .NET 中，async/await 是默认 fire-and-forget 的：在 `async` 方法返回的 `Task` 内部 `await` 等待的任务结束时，`await` 之后的代码会被自动 schedule 到原 `SynchronizationContext` 继续执行，即使调用者并没有 `await` `async` 方法返回的 `Task`。但在其它语言，比如 Rust 中，async/await 默认是 lazy 的，只有外部 `await`，内部才会继续执行内部 `await` 后的代码，而 fire-and-forget 需要主动调用函数来实现。[^rust]

[^rust]: [rust - Why do asynchronous tasks (functions) not run unless awaited? - Stack Overflow](https://stackoverflow.com/questions/70357544/why-do-asynchronous-tasks-functions-not-run-unless-awaited)

[c# - Proper way to start and fire-and-forget asynchronous calls? - Stack Overflow](https://stackoverflow.com/questions/61316504/proper-way-to-start-and-fire-and-forget-asynchronous-calls)

### Discards
[Discards - unassigned discardable variables - C# | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/functional/discards#a-standalone-discard)

```csharp
private static async Task ExecuteAsyncMethods()
{
    Console.WriteLine("About to launch a task...");
    _ = Task.Run(() =>
    {
        var iterations = 0;
        for (int ctr = 0; ctr < int.MaxValue; ctr++)
            iterations++;
        Console.WriteLine("Completed looping operation...");
        throw new InvalidOperationException();
    });
    await Task.Delay(5000);
    Console.WriteLine("Exiting after 5 second delay");
}
// The example displays output like the following:
//       About to launch a task...
//       Completed looping operation...
//       Exiting after 5 second delay
```
Assigning the task has the effect of suppressing the exception that the operation throws as it is about to complete. It makes your intent clear: You want to discard the `Task`, and ignore any errors generated from that asynchronous operation.

Without assigning the task to a discard, the following code generates a compiler warning:
```csharp
private static async Task ExecuteAsyncMethods()
{
    Console.WriteLine("About to launch a task...");
    // CS4014: Because this call is not awaited, execution of the current method continues before the call is completed.
    // Consider applying the 'await' operator to the result of the call.
    Task.Run(() =>
    {
        var iterations = 0;
        for (int ctr = 0; ctr < int.MaxValue; ctr++)
            iterations++;
        Console.WriteLine("Completed looping operation...");
        throw new InvalidOperationException();
    });
    await Task.Delay(5000);
    Console.WriteLine("Exiting after 5 second delay");
}
```
If the caller (`ExecuteAsyncMethods`) is not `async`, there will be no warnings.

### `async void`
Avoid `async void` except with event handlers.
- Any exceptions thrown out of an `async void` method will be raised directly on the `SynchronizationContext` that was active when the async void method started.

[Async/Await - Best Practices in Asynchronous Programming | Microsoft Learn](https://learn.microsoft.com/en-us/archive/msdn-magazine/2013/march/async-await-best-practices-in-asynchronous-programming)

[Removing async void | John Thiriet](https://johnthiriet.com/removing-async-void/)

## Do not await null
Await null will throw a NullReferenceException. Await `Task.FromResult()` or `Task.CompletedTask` instead.

Always using `async` can prevent a method from carelessly returning `null`.

See also:
- [Proposal: await? (Null-aware await) · Issue #7171 · dotnet/roslyn](https://github.com/dotnet/roslyn/issues/7171)
- [Champion "Null-conditional await" · Issue #35 · dotnet/csharplang](https://github.com/dotnet/csharplang/issues/35)

## Warning CS1998: This async method lacks 'await' operators and will run synchronously
[Async gotcha: returning Task.FromResult or Task.CompletedTask](https://dev.to/asik/dont-return-taskfromresult-or-taskcompletedtask-4gcp)