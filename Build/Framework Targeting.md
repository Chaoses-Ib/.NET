# [Framework Targeting](https://learn.microsoft.com/en-us/visualstudio/ide/visual-studio-multi-targeting-overview)

[Target frameworks in SDK-style projects](https://learn.microsoft.com/en-us/dotnet/standard/frameworks)
- `net48`
- `netstandard2.0`
- `net6.0`

## Preprocessor directives
```csharp
public class MyClass
{
    static void Main()
    {
#if NET40
        Console.WriteLine("Target framework: .NET Framework 4.0");
#elif NET45
        Console.WriteLine("Target framework: .NET Framework 4.5");
#else
        Console.WriteLine("Target framework: .NET Standard 1.4");
#endif
    }
}
```

[Symbols](https://learn.microsoft.com/en-us/dotnet/standard/frameworks#preprocessor-symbols):
- `NETFRAMEWORK`, `NET48`, `NET48_OR_GREATER`
- `NETSTANDARD`, `NETSTANDARD2_0`, `NETSTANDARD2_0_OR_GREATER`
- `NET`, `NET6_0`, `NET6_0_OR_GREATER`