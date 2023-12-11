# Input
## Focus
[Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/advanced/focus-overview?view=netframeworkdesktop-4.8)

Focus vs activation:
- [what is the difference between activate and got focus?-VBForums](https://www.vbforums.com/showthread.php?323192-what-is-the-difference-between-activate-and-got-focus)

[FocusManager](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.focusmanager)

[WPF and initial focus - Stack Overflow](https://stackoverflow.com/questions/817610/wpf-and-initial-focus)

```xaml
<Window FocusManager.FocusedElement="{Binding ElementName=SomeElement}">

   <DataGrid x:Name="SomeElement">
     ...
   </DataGrid>
</Window>
```

XAML Hot Reload 对 focus 逻辑存在一定影响，在修改 XAML 中的 focus 相关逻辑后最好重新启动进行验证。

- [UIElement.PreviewLostKeyboardFocus Event (System.Windows) | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.windows.uielement.previewlostkeyboardfocus)

  [c# - WPF: Is this behavior intended? PreviewLostKeyboardFocus and LostKeyboardFocus - Stack Overflow](https://stackoverflow.com/questions/43073954/wpf-is-this-behavior-intended-previewlostkeyboardfocus-and-lostkeyboardfocus)
  > The `PreviewLostKeyboardFocus` event is not raised when you switch to another application.

## Input bindings
Some controls have built-in input bindings. But most ones are not documented. See [event debugging](../Events.md#debugging) for debugging such built-in input bindings.

[wpf - InputBindings work only when focused - Stack Overflow](https://stackoverflow.com/questions/23316274/inputbindings-work-only-when-focused)

## Hit testing
[Hit Testing in the Visual Layer - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/graphics-multimedia/hit-testing-in-the-visual-layer)

[wpf - How to hit detect on a null or transparent background? - Stack Overflow](https://stackoverflow.com/questions/15169358/how-to-hit-detect-on-a-null-or-transparent-background)
- `HitTesting` would work if the `Background` is `Transparent` if you're actually using it.