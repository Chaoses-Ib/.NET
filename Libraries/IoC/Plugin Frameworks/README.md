# Plugin Frameworks
[Managed Extensibility Framework (MEF) and other extensibility options in .NET… | POP Coder](https://emcpadden.wordpress.com/2008/12/07/managed-extensibility-framework-and-others/)

- [Assembly.Load()](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.assembly.load?view=netframework-4.8)

  [Plug-ins in C# - CodeProject](https://www.codeproject.com/Articles/6334/Plug-ins-in-C)
- [Managed Add-in Framework](Managed%20Add-in%20Framework.md)
- [Managed Extensibility Framework](Managed%20Extensibility%20Framework.md)
- .NET Core only
  - [AssemblyLoadContext](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.loader.assemblyloadcontext)

    [Create a .NET Core application with plugins - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/core/tutorials/creating-app-with-plugin-support)
  - [.NET Plugins](https://github.com/natemcmaster/DotNetCorePlugins)
  
    This project provides API for loading .NET assemblies dynamically, executing them as extensions to the main application, and finding and isolating the dependencies of the plugin from the main application.
  - [Plugin Framework for .NET Core](https://github.com/weikio/PluginFramework)
  - [Prise](https://github.com/merken/Prise)

## Compatibility
[c# - Plugin Architecture With Forward & Backward Compatibility - Stack Overflow](https://stackoverflow.com/questions/15443536/plugin-architecture-with-forward-backward-compatibility)

## Security
Sandboxes:
- Isolated AppDomain

  由于 .NET Framework 的主 AppDomain 不允许卸载 assembly，只能销毁整个 AppDomain[^appdomain-unload]，如果要实现插件的动态卸载，也需要将插件加载到独立的 AppDomain 中。

  [mef - Looking for a practical approach to sandboxing .NET plugins - Stack Overflow](https://stackoverflow.com/questions/4145713/looking-for-a-practical-approach-to-sandboxing-net-plugins)

- Managed Add-in Framework

## MEF vs MAF
The focus of MAF is slightly higher-level than MEF, concentrating on extension isolation and assembly loading and unloading, while MEF's focus is on discoverability, extensibility, and portability. The two frameworks interoperate smoothly, and a single application can take advantage of both.[^mef]

[Kent Boogaart: MAF and MEF](http://web.archive.org/web/20140114182810/http://kentb.blogspot.com/2009/02/maf-and-mef.html)

[^mef]: [Managed Extensibility Framework (MEF) - .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/mef/)
[^appdomain-unload]: [c# - How to unload an assembly from the primary AppDomain? - Stack Overflow](https://stackoverflow.com/questions/123391/how-to-unload-an-assembly-from-the-primary-appdomain)