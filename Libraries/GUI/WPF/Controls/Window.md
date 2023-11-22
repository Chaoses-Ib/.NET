# [Window](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window)
[Windows in WPF overview - WPF .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/windows/)

## Lifetime
1. [Show](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.show)

   When `Show` is called, a window does initialization work before it's shown to establish infrastructure that allows it to receive user input. When the window is initialized, the [SourceInitialized](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.sourceinitialized#system-windows-window-sourceinitialized) event is raised and the window is shown.
2. [FrameworkElement.Initialized](https://learn.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement.initialized)
3. [SourceInitialized](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.sourceinitialized#system-windows-window-sourceinitialized)

   [c# - Difference between OnInitialized and OnSourceInitialized in WPF - Stack Overflow](https://stackoverflow.com/questions/54646062/difference-between-oninitialized-and-onsourceinitialized-in-wpf)
4. [ShowActivated](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.showactivated) (`true` by default)
   1. [Activated](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.activated#system-windows-window-activated)
5. [FrameworkElement.Loaded](https://learn.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement.loaded)

   > Whether you choose to handle `Loaded` or `Initialized` depends on your requirements. If you do not need to read element properties, intend to reset properties, and do not need any layout information, `Initialized` might be the better event to act upon. If you need all properties of the element to be available, and you will be setting properties that are likely to reset the layout, `Loaded` might be the better event to act upon. Be careful of reentrancy if your handler resets any properties that are interpreted by the layout system to mean that a new layout pass is required.

   - 在 Window loaded 前操作 element properties 并不会触发异常。
   - `WindowStartupLocation` 在 `Loaded` 之前就生效了。 
6. [ContentRendered](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.contentrendered)

   If the window has no content, this event is not raised.
7. [Activate](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.activate)
8. [Activated](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.activated#system-windows-window-activated)
9.  [IsActive](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.isactive)
10. [Deactivated](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.deactivated#system-windows-window-deactivated)
11. [Hide](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.hide)
12. [Close](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.close)
13. [Closing](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.closing#system-windows-window-closing)
14. [Deactivated](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.deactivated#system-windows-window-deactivated)
15. [Closed](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window.closed#system-windows-window-closed)

- `Application.Current.Windows`
  - Backed by an `ArrayList`.
  - [c# - How do I know if a WPF window is opened - Stack Overflow](https://stackoverflow.com/questions/16202101/how-do-i-know-if-a-wpf-window-is-opened)
  - [c# - Refer to active Window in WPF? - Stack Overflow](https://stackoverflow.com/questions/2038879/refer-to-active-window-in-wpf)

## WindowChrome
- [ControlzEx.WindowChromeBehavior](https://github.com/ControlzEx/ControlzEx#windowchromebehavior)
  - Draw anywhere inside the window (including the titlebar)
  - Supports every `WindowStyle` (`None`, `SingleBorderWindow`, `ThreeDBorderWindow` and `ToolWindow`)
  - Supports jitter free window resizes
  - Allows you to ignore the taskbar when the window is maximized
  - Provides an `IsNCActive` property
  - Mitigates a bug in Windows that causes newly shown windows to briefly be shown with a pure white background
  - Starting with Windows 11:
    - Allows you to control rounded corners (through `CornerPreference`)
    - Supports snap menu on window buttons (through attached properties like `NonClientControlProperties.HitTestResult` and `NonClientControlProperties.ClickStrategy`)

  Notes:
  - Changing the icon or title of a window will cause it to redraw the entire window. ([WindowChromeBehavior.MessageHandling.cs](https://github.com/ControlzEx/ControlzEx/blob/8ea2b94753b39b07310edc847fb825929bf25b81/src/ControlzEx/Behaviors/WindowChrome/WindowChromeBehavior.MessageHandling.cs#L212-L220), [SuppressRedrawScope.cs](https://github.com/ControlzEx/ControlzEx/blob/8ea2b94753b39b07310edc847fb825929bf25b81/src/ControlzEx/Behaviors/WindowChrome/WindowChromeBehavior.SuppressRedrawScope.cs#L37))
    - If `AllowsTransparency="True"`, this will cause the window to randomly flicker.