# ScrollViewer
[ScrollViewer - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/controls/scrollviewer?view=netframeworkdesktop-4.8)

- [`ScrollBarVisibility`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.scrollbarvisibility)
  - [#887 -- The Difference between Disabled and Hidden Scrollbar Visibility | 2,000 Things You Should Know About WPF](https://wpf.2000things.com/2013/08/19/887-the-difference-between-disabled-and-hidden-scrollbar-visibility/)
  - `VerticalScrollBarVisibility` defaults to `Visible`.
  - `HorizontalScrollBarVisibility` defaults to `Hidden`.

## Input
### Horizontal scrolling
- Shift + mouse wheel
  
  [How to enable horizontal scrolling with mouse? - Stack Overflow](https://stackoverflow.com/questions/3727439/how-to-enable-horizontal-scrolling-with-mouse)

- Horizontal wheel (touchpad)

  [Official mouse events for `WM_MOUSEHWHEEL` horizontal wheel scrolling are not defined yet - Issue #3201 - dotnet/wpf](https://github.com/dotnet/wpf/issues/3201)
  - [Add Horizontal MouseWheel Scrolling Support - Issue #5937 - dotnet/wpf](https://github.com/dotnet/wpf/issues/5937)

  [Support Horizontal Scrolling of TouchPad in WPF Application - walterlv](https://blog.walterlv.com/post/handle-horizontal-scrolling-of-touchpad-en.html)

  [c# - How to horizontally scroll in WPF using mouse tilt wheel? - Stack Overflow](https://stackoverflow.com/questions/4158101/how-to-horizontally-scroll-in-wpf-using-mouse-tilt-wheel)
  - `MouseHorizontalWheelEnabler`

    `AutoEnableMouseHorizontalWheelSupport` may not work and `EnableMouseHorizontalWheel` has to be called manually.