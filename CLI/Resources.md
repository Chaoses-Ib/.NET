# [Resources](https://learn.microsoft.com/en-us/dotnet/core/extensions/resources)
A **resource** is any non-executable data that is logically deployed with an app. Resources can contain data in a number of forms, including strings, images, and persisted objects. Storing your data in a resource file enables you to change the data without recompiling your entire app. It also enables you to store data in a single location, and eliminates the need to rely on hard-coded data that is stored in multiple locations.

## Non-localized resources
In a non-localized app, you can use resource files as a repository for app data, particularly for strings that might otherwise be hard-coded in multiple locations in source code.

Most commonly, you
1. Create resources as either text (.txt) or XML (.resx) files
2. Use [Resgen.exe (Resource File Generator)](https://learn.microsoft.com/en-us/dotnet/framework/tools/resgen-exe-resource-file-generator) to compile them into binary .resources files
3. These files can then be embedded in the app's executable file by a language compiler

Code generators:
- Resgen (ResXFileCodeGenerator/[PublicResXFileCodeGenerator](http://guysmithferrier.com/post/2008/06/Public-Strongly-Typed-Resources-With-PublicResXFileCodeGenerator.aspx))
- [VocaDb.ResXFileCodeGenerator](https://github.com/VocaDB/ResXFileCodeGenerator)
- [EF Core/Resources.tt](https://github.com/dotnet/efcore/blob/main/tools/Resources.tt)

  [跑题的字符串国际化简易工具 - GKarch](https://blog.gkarch.com/2015/09/divergent-simple-i18n-tools.html)

## Localized resources
When you develop an app that uses localized resources, you designate a culture that serves as the neutral or fallback culture whose resources are used if no suitable resources are available.

Typically, the resources of the neutral culture are stored in the app's executable. The remaining resources for individual localized cultures are stored in standalone satellite assemblies. A **satellite assembly** contains the resources of a single culture; it does not contain any app code. Because the satellite assemblies are not part of the main assembly, you can easily replace or update resources corresponding to a specific culture without replacing the app's main assembly.

Tools:
- [ResX Resource Manager: Manage localization of all ResX-Based resources in one central place.](https://github.com/dotnet/ResXResourceManager)

## Retrieve resources
At run time, an app loads the appropriate localized resources on a per-thread basis, based on the culture specified by the [CultureInfo.CurrentUICulture](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.currentuiculture) property. This property value is derived as follows:
1. By directly assigning a [CultureInfo](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo) object that represents the localized culture to the [Thread.CurrentUICulture](https://learn.microsoft.com/en-us/dotnet/api/system.threading.thread.currentuiculture) property.
2. If a culture is not explicitly assigned, by retrieving the default thread UI culture from the [CultureInfo.DefaultThreadCurrentUICulture](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.defaultthreadcurrentuiculture) property.
3. If a default thread UI culture is not explicitly assigned, by retrieving the culture for the current user on the local computer. .NET implementations running on Windows do this by calling the Windows [GetUserDefaultUILanguage](https://learn.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultuilanguage) function.

You can then retrieve resources for the current UI culture or for a specific culture by using the [System.Resources.ResourceManager](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resourcemanager) class. Although the [ResourceManager](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resourcemanager) class is most commonly used for retrieving resources, the [System.Resources](https://learn.microsoft.com/en-us/dotnet/api/system.resources) namespace contains additional types that you can use to retrieve resources. These include:
- The [ResourceReader](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resourcereader) class, which enables you to enumerate resources embedded in an assembly or stored in a standalone binary .resources file. It is useful when you don't know the precise names of the resources that are available at run time.
- The [ResXResourceReader](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resxresourcereader) class, which enables you to retrieve resources from an XML (.resx) file.
- The [ResourceSet](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resourceset) class, which enables you to retrieve the resources of a specific culture without observing fallback rules. The resources can be stored in an assembly or a standalone binary .resources file. You can also develop an [IResourceReader](https://learn.microsoft.com/en-us/dotnet/api/system.resources.iresourcereader) implementation that enables you to use the [ResourceSet](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resourceset) class to retrieve resources from some other source.
- The [ResXResourceSet](https://learn.microsoft.com/en-us/dotnet/api/system.resources.resxresourceset) class, which enables you to retrieve all the items in an XML resource file into memory.

## Memory usage
