# Project SDKs
[.NET project SDK overview](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview)

## SDK-style projects vs non-SDK-style projects
[Identify the project format](https://learn.microsoft.com/en-us/nuget/resources/check-project-format)

Compared to non-SDK-style projects, SDK-style projects are less clutter, can generate packages on build and can automaticlly reload after editing.[^rubberduckdev]

新建：Visual Studio 目前并不支持创建 SDK-style 的 .NET Framework 项目，只能通过创建 .NET Standard 项目并修改 [TargetFramework](Framework%20Targeting.md) 来间接创建。

迁移：[Moving to SDK-Style projects and package references in Visual Studio](https://hermit.no/moving-to-sdk-style-projects-and-package-references-in-visual-studio-part-1/)

[^rubberduckdev]: [SDK style csproj & .Net framework](https://www.rubberduckdev.com/sdkstyle-framework-csproj/)
