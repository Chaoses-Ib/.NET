# Exceptions
## UnhandledException
[What causes the UnhandledExceptionEventArgs.IsTerminating flag to be true or false? - Stack Overflow](https://stackoverflow.com/questions/10982443/what-causes-the-unhandledexceptioneventargs-isterminating-flag-to-be-true-or-fal)
> This property is always true. It used to be possible to be false, way back in the .NET 1.x days. That version allowed a thread to die on an unhandled exception without that having the entire process terminate. That just didn't work out well, programmers didn't implement the event handler (or didn't know how to properly handle the exception from the event, who does) so threads just died without any notice whatsoever. Almost impossible to not have this cause difficult to diagnose program failure.
> 
> Microsoft changed the default behavior in .NET 2.0, an unhandled exception terminates the program. Technically it is still possible to override this behavior, a custom CLR host can keep the process alive by implementing the IHostPolicyManager interface. And the default host supports the `<legacyUnhandledExceptionPolicy>` config element. Don't use it, that way lies dragons.

[Allow ignoring unhandled exceptions in UnhandledException event handler - Issue #42275 - dotnet/runtime](https://github.com/dotnet/runtime/issues/42275)
- > `IsTerminating` behavior is poorly defined and it is always true (unless one uses the unsupported config switch).
- [\[API Proposal\]: Overriding the default behavior in case of unhandled exceptions and fatal errors. - Issue #101560 - dotnet/runtime](https://github.com/dotnet/runtime/issues/101560)