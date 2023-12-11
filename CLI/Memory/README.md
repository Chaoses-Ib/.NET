# Memory Management
## Performance
[.NET Memory Performance Analysis](https://github.com/Maoni0/mem-doc/blob/master/doc/.NETMemoryPerformanceAnalysis.md)

Tools:
- Visual Studio
  - [XAML Hot Reload impact on performance diagnostics - Visual Studio (Windows) | Microsoft Learn](https://learn.microsoft.com/en-us/visualstudio/xaml-tools/xaml-hot-reload-impact-performance)

    会导致显示窗口后内存占用攀升一段时间。
- [dotMemory: a Memory Profiler & Unit-Testing Framework for .NET by JetBrains](https://www.jetbrains.com/dotmemory/)
  - "Incoming References" has no cycle detection, unlike VS.
  - No support for showing inclusive sizes.
  - No support for dark mode.

### Memory usage
[Rediscover the Art of Memory Optimization in Your Managed Code | Microsoft Learn](https://learn.microsoft.com/en-us/archive/msdn-magazine/2005/january/rediscover-the-art-of-memory-optimization-in-your-managed-code)

[c# - Reducing memory usage of .NET applications? - Stack Overflow](https://stackoverflow.com/questions/1343374/reducing-memory-usage-of-net-applications)

## [→WPF](../../Libraries/GUI/WPF/Memory.md)