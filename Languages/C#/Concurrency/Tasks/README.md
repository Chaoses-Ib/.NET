# Tasks
## Scheduling new tasks
- `Task.Factory.StartNew()`
- `Task.Run()` (.NET Framework 4.5)

  `Task.Run(someAction)` is exactly equivalent to:
  ```csharp
  Task.Factory.StartNew(someAction,
      CancellationToken.None, TaskCreationOptions.DenyChildAttach, TaskScheduler.Default);
  ```

  [Task.Run vs Task.Factory.StartNew - .NET Parallel Programming](https://devblogs.microsoft.com/pfxteam/task-run-vs-task-factory-startnew/)