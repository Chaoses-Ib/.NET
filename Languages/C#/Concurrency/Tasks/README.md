# Tasks
## Scheduling new tasks
- `Task.Factory.StartNew()`

  [StartNew is Dangerous](https://blog.stephencleary.com/2013/08/startnew-is-dangerous.html)
  - Does not understand `async` delegates.

    Be careful with `Task.Factory.StartNew(async () => await ...)`, as the return value is `Task<Task>`.
    
  - Confusing default scheduler.

- `Task.Run()` (.NET Framework 4.5)

  `Task.Run(someAction)` is exactly equivalent to:
  ```csharp
  Task.Factory.StartNew(someAction,
      CancellationToken.None, TaskCreationOptions.DenyChildAttach, TaskScheduler.Default);
  ```

  [Task.Run vs Task.Factory.StartNew - .NET Parallel Programming](https://devblogs.microsoft.com/pfxteam/task-run-vs-task-factory-startnew/)