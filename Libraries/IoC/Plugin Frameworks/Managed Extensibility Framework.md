# [Managed Extensibility Framework](https://learn.microsoft.com/en-us/dotnet/framework/mef/)
The **Managed Extensibility Framework** is a library for creating lightweight, and extensible applications. It allows application developers to discover and use extensions with no configuration required. It also lets extension developers easily encapsulate code and avoid fragile hard dependencies. MEF not only allows extensions to be reused within applications, but across applications as well.

[MEF Sample: Simple Calculator (Visual Basic)](https://github.com/dotnet/samples/tree/main/mef/simple-calculator/vb)

## Implementations
- MEF (.NET Framework 4.0)
- MEF2 (.NET Framework 4.5)
- [Portable MEF2 (Microsoft.Composition)](https://www.nuget.org/packages/Microsoft.Composition) (deprecated)
- [.NET Core MEF2 (System.Composition)](https://www.nuget.org/packages/System.Composition)
- [VS MEF](https://github.com/microsoft/vs-mef)

[.NET Core 和 .NET Framework 中的 MEF2 - walterlv](https://blog.walterlv.com/post/mef2-from-nuget.html)

## Projects using MEF
- MEF2
- .NET Core MEF2
  - [Apache Lucene.NET](https://github.com/apache/lucenenet)
- VS MEF
  - Visual Studio
  - [Roslyn](https://github.com/dotnet/roslyn)
  - [dnSpy](https://github.com/dnSpy/dnSpy)
  - [ILSpy](https://github.com/icsharpcode/ILSpy)
  - [Git Extensions](https://github.com/gitextensions/gitextensions)

## MEF vs IoC containers
> MEF is preferred to be used when one has to deal with unknown types or a plugin based architecture.
> 
> IoC containers are preferred to be used with known types.
> 
> Moreover, MEF is an architectural solution for dependency injection
> 
> Whereas, IoC containers are code-level solutions for dependency injection.
> 
> IoC containers are just dependency injection techniques which populates the instance of a class and if the constructor of those classes requires objects of other classes, then IoC also injects the required objects. But MEF does more than just dependency injection. Although, MEF also uses an IoC-based approach for dependency injection, but MEF does so many other things apart from dependency injection.
> 
> MEF has got two components:
> 
> 1.  Catalog: Is responsible for discovering extension
>     
> 2.  Container: Provides the ability to load an extension to a running application
>     
> MEF is more than just dependency injection techniques. It is used wherein we need a plugin-based architecture for our application, but at the same time MEF uses an IoC-based approach for dependency injection.[^ioc-so]

[^ioc-so]: [dependency injection - Difference between MEF and IoC containers (like Unity, Autofac, SMap, Ninject, Windsor.Spring.net, etc.) - Stack Overflow](https://stackoverflow.com/questions/15572302/difference-between-mef-and-ioc-containers-like-unity-autofac-smap-ninject-w)
