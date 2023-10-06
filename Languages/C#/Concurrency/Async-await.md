# Async/await
## Discards
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

## Do not await null
Await null will throw a NullReferenceException. Await `Task.FromResult()` or `Task.CompletedTask` instead.

See also:
- [Proposal: await? (Null-aware await) · Issue #7171 · dotnet/roslyn](https://github.com/dotnet/roslyn/issues/7171)
- [Champion "Null-conditional await" · Issue #35 · dotnet/csharplang](https://github.com/dotnet/csharplang/issues/35)

## Warning CS1998: This async method lacks 'await' operators and will run synchronously
[Async gotcha: returning Task.FromResult or Task.CompletedTask](https://dev.to/asik/dont-return-taskfromresult-or-taskcompletedtask-4gcp)