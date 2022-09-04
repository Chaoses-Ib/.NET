# Timing
## [Stopwatch](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.stopwatch)
```csharp
using System;
using System.Diagnostics;
using System.Threading;

// Stopwatch stopwatch = new();
// stopwatch.Start();
var stopwatch = Stopwatch.StartNew();
Thread.Sleep(1234);
stopwatch.Stop();

// Resume:
//   stopwatch.Start();
// Restart:
//   stopwatch.Restart();
//  or:
//   stopwatch.Reset();
//   stopwatch.Start();

TimeSpan ts = stopwatch.Elapsed;
Console.WriteLine($"Run time: {ts.Hours:00}:{ts.Minutes:00}:{ts.Seconds:00}.{ts.Milliseconds:000}");
```