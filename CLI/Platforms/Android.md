# Android
- [Java.Interop: Open-source bindings of Java's Java Native Interface (JNI) for use with .NET managed languages such as C# (github.com)](https://github.com/xamarin/java.interop)
  - [.NET Android: Open-source bindings of the Android SDK for use with .NET managed languages such as C#](https://github.com/xamarin/xamarin-android)
    - [Xamarin.Essentials: Essential cross platform APIs for your mobile apps.](https://github.com/xamarin/Essentials)

[Java Integration](https://learn.microsoft.com/en-us/xamarin/android/platform/java-integration/)

[Binding a Java Library](https://learn.microsoft.com/en-us/xamarin/android/platform/binding-java-library/)

[MauiAppJnilibSample: MAUI application sample using services from a java library.](https://github.com/arvindd/MauiAppJnilibSample)

## Build
Debug 默认会启用 [Fast Deployment](https://learn.microsoft.com/en-us/xamarin/android/deploy-test/building-apps/build-process#fast-deployment)，此时生成的 APK 不能独立部署，也只支持某一 ABI。

ABI:
- RuntimeIdentifiers

  ```xml
  <RuntimeIdentifiers Condition="$(TargetFramework.Contains('-android'))">android-arm64;android-arm;android-x64;android-x86</RuntimeIdentifiers>
  ```
- ~~[AndroidSupportedAbis](https://learn.microsoft.com/en-us/xamarin/android/deploy-test/building-apps/build-properties#androidsupportedabis)~~

  ```xml
  <AndroidSupportedAbis>arm64-v8a;armeabi-v7a;x86_64;x86</AndroidSupportedAbis>
  ```

Visual Studio:
- [c# - Project not selected to build for this solution configuration - Stack Overflow](https://stackoverflow.com/questions/37675012/project-not-selected-to-build-for-this-solution-configuration)

## Debugging
[Develop Android apps with Avalonia UI and run them on WSA](https://curia.me/develop-android-applications-with/)

如果 debug 时与设备连接缓慢，或是无法运行 app，可以尝试 kill 所有 adb 进程。