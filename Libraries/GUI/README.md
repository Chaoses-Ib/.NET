# GUI
- Windows Forms (WinForms)
  - [Modern.Forms](WinForms/README.md#modernforms)
- XAML-based
  - Windows Presentation Foundation (WPF)
  - Universal Windows Platform (UWP)
  - Windows UI (WinUI)
  - Xamarin.Forms
    - Multi-platform App UI (MAUI)
  - Uno
  - Avalonia
- [Eto.Forms: Cross platform GUI framework for desktop and mobile applications in .NET](https://github.com/picoe/Eto)
- Unity

## Comparison
- MAUI 使用 native controls，类似 React Native。
- Avalonia 自主绘制 controls，类似 Flutter。
- Uno 混合了两种做法，只使用 native controls 的行为，而自主绘制 controls 的外观。

自主绘制易于在不同的平台上保持相同的视觉效果，不仅降低了 UI 开发成本，还有利于塑造品牌。从另一个角度来说，跨平台框架本就是在通过牺牲平台原生体验来实现代码共享，自主绘制只是在这之上更进了一步。再从另一个角度来说，native controls 也只是平台对自己的视觉语言的实现，自主绘制也并不一定要破坏平台的统一性。另一方面，native controls 的有限性还会对 UI 造成限制。[^drawn-reddit]

- [How is Uno Platform different from Xamarin.Forms, MAUI or Avalonia?](https://platform.uno/docs/articles/faq.html#how-is-uno-platform-different-from-xamarinforms-maui-or-avalonia)
- [Xamarin.Forms, .NET Maui and the Uno Platform - Nick's .NET Travels](https://nicksnettravels.builttoroam.com/multi-platform-comparison/)
- [What is the future Microsoft? · dotnet/maui · Discussion #4879](https://github.com/dotnet/maui/discussions/4879)
- [.NET MAUI vs UNO platform : dotnet](https://www.reddit.com/r/dotnet/comments/r6kyeu/net_maui_vs_uno_platform/)
- [MAUI vs Avalonia : csharp](https://www.reddit.com/r/csharp/comments/zzmwux/maui_vs_avalonia/)
- [Uno vs. Avalonia : csharp](https://www.reddit.com/r/csharp/comments/y01ikg/uno_vs_avalonia/)

## Control libraries
- [Syncfusion: .NET, Xamarin, JavaScript, Angular UI components](https://www.syncfusion.com/)


[^drawn-reddit]: [Why prefer drawn controls over mapping to native? : FlutterDev](https://www.reddit.com/r/FlutterDev/comments/v6g276/why_prefer_drawn_controls_over_mapping_to_native/)