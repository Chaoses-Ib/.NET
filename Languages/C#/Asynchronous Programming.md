# Asynchronous Programming
## Do not await null
Await null will throw a NullReferenceException. Await `Task.FromResult()` or `Task.CompletedTask` instead.

See also:
- [Proposal: await? (Null-aware await) · Issue #7171 · dotnet/roslyn](https://github.com/dotnet/roslyn/issues/7171)
- [Champion "Null-conditional await" · Issue #35 · dotnet/csharplang](https://github.com/dotnet/csharplang/issues/35)

## Warning CS1998: This async method lacks 'await' operators and will run synchronously
[Async gotcha: returning Task.FromResult or Task.CompletedTask](https://dev.to/asik/dont-return-taskfromresult-or-taskcompletedtask-4gcp)