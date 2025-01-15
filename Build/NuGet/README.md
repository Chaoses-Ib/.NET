# NuGet
[What is NuGet and what does it do? | Microsoft Learn](https://learn.microsoft.com/en-us/nuget/what-is-nuget)

## Cache
[How to manage the global packages, cache, temp folders in NuGet | Microsoft Learn](https://learn.microsoft.com/en-us/nuget/consume-packages/managing-the-global-packages-and-cache-folders)
```sh
dotnet nuget locals all --list

dotnet nuget locals all --clear
```
> NuGet 3.5 and earlier uses *packages-cache* instead of the *http-cache*, which is located in `%localappdata%\NuGet\Cache`.