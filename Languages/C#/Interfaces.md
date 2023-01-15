# Interfaces
## Duck typing
- [Dynamic type](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/types/using-type-dynamic)
- [ImpromptuInterface](https://github.com/ekonbenefits/impromptu-interface)
- [Duck Typing Library](https://github.com/meyertime/DuckTyping)

  .NET Framework 2.0.
- [DuckInterface](https://github.com/byme8/DuckInterface)

  By Source Generators.
- [DynamicObjects – Duck-Typing in .NET - CodeProject](https://www.codeproject.com/Articles/122827/DynamicObjects-Duck-Typing-in-NET)
- [DuckTyping: Runtime Dynamic Interface Implementation - CodeProject](https://www.codeproject.com/Articles/16074/DuckTyping-Runtime-Dynamic-Interface-Implementatio)
- [DynamicProxy | Castle Project](http://www.castleproject.org/projects/dynamicproxy/)

  [Bug squash: Duck typing with Castle DynamicProxy](http://bugsquash.blogspot.com/2009/05/duck-typing-with-castle-dynamicproxy.html)
- Inheritance
  
  ```csharp
  class FooWrapper : Foo, IBar {
      public FooWrapper(Foo foo) : base(foo) { }
  }
  ```

[Duck typing via anonymous interface implementation wrappers · Discussion #5793 · dotnet/csharplang](https://github.com/dotnet/csharplang/discussions/5793)
