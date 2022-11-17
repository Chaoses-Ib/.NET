# Memory- and Span-related Types
[Memory and spans | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/memory-and-spans/)

[C# - All About Span: Exploring a New .NET Mainstay | Microsoft Learn](https://learn.microsoft.com/en-us/archive/msdn-magazine/2018/january/csharp-all-about-span-exploring-a-new-net-mainstay)

For earlier frameworks, `Span<T>` and `Memory<T>` are available in the [System.Memory NuGet package](https://www.nuget.org/packages/System.Memory/).

## Span
Instance of type 'Span' cannot be used inside a nested function, query expression, iterator block or async method:
- [c# - Need a workaround to access ReadOnlySpan<T> inside a function that returns an IEnumerable - Stack Overflow](https://stackoverflow.com/questions/66379248/need-a-workaround-to-access-readonlyspant-inside-a-function-that-returns-an-ie)

[c# - What is a working alternative to being unable to pass a Span<T> into lambda expression? - Stack Overflow](https://stackoverflow.com/questions/59605908/what-is-a-working-alternative-to-being-unable-to-pass-a-spant-into-lambda-expr)

## [ArraySegment](https://learn.microsoft.com/en-us/dotnet/api/system.arraysegment-1)
To access an element in the range of an ArraySegment, you need:
```csharp
arraySegment.Array[arraySegment.Offset + i]
```

## Memory

## MemoryPool

## MemoryManager