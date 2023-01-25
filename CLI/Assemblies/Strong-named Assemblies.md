# [Strong-named Assemblies](https://learn.microsoft.com/en-us/dotnet/standard/assembly/strong-named)
## Assembly version
[.net - Is it possible to replace a reference to a strongly-named assembly with a "weak" reference? - Stack Overflow](https://stackoverflow.com/questions/6874975/is-it-possible-to-replace-a-reference-to-a-strongly-named-assembly-with-a-weak)

尽管可以通过 AppDomain.AssemblyResolve 来加载同一 strong-named assembly 的任意版本，但由于静态的类型引用是与版本绑定的，使用者必须使用动态类型来对加载的 assembly 进行调用。

另一种方法则是使用 [Assembly Binding Redirection](https://learn.microsoft.com/en-us/previous-versions/dotnet/netframework-1.1/2fc472t2(v=vs.71)?redirectedfrom=MSDN)。

另外，strong-named assemblies 的版本绑定只与 assembly version 有关，与 file version 无关，可以任意修改。

## Signing
[c# - How to fix "Referenced assembly does not have a strong name" error - Stack Overflow](https://stackoverflow.com/questions/331520/how-to-fix-referenced-assembly-does-not-have-a-strong-name-error)

Tools:
- [.NET Assembly Strong-Name Signer](https://github.com/brutaldev/StrongNameSigner)
- [Strong Namer](https://github.com/dsplaisted/strongnamer) (discontinued)
- [Nivot.StrongNaming: A set of PowerShell Cmdlets to facilitate signing of unsigned 3rd party assemblies with a key of your choice, to allow them to be referenced by strongly named projects.](https://github.com/oising/strongnaming)

## InternalsVisbleTo
- [c# - How to use "InternalsVisibleTo" attribute with Strongly named assembly? - Stack Overflow](https://stackoverflow.com/questions/30943342/how-to-use-internalsvisibleto-attribute-with-strongly-named-assembly)
