# [Autofac](https://autofac.org/)
[GitHub](https://github.com/autofac/Autofac)

## Resolving services
[Implicit Relationship Types](https://autofac.readthedocs.io/en/latest/resolve/relationships.html)

## [Circular dependencies](https://autofac.readthedocs.io/en/latest/advanced/circular-dependencies.html)
- `Lazy<B>`
- `Func<B>` or `Func<Owned<B>>`

[c# - How to solve Autofac circular dependency? - Stack Overflow](https://stackoverflow.com/questions/43729119/how-to-solve-autofac-circular-dependency)

## [Controlling scope and lifetime](https://autofac.readthedocs.io/en/latest/lifetime/index.html)
> **It is important to always resolve services from a lifetime scope and not the root container.** Due to the disposal tracking nature of lifetime scopes, if you resolve a lot of disposable components from the container (the "root lifetime scope"), you may inadvertently cause yourself a memory leak. The root container will hold references to those disposable components for as long as it lives (usually the lifetime of the application) so it can dispose of them. [You can change disposal behavior if you choose](https://autofac.readthedocs.io/en/latest/lifetime/disposal.html), but it's a good practice to only resolve from a scope. If Autofac detects usage of a singleton or shared component, it will automatically place it in the appropriate tracking scope.

Is it safe to only dispose a `Owned<B>`'s `Value`?