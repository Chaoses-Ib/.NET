# Input
## Focus
[Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/advanced/focus-overview?view=netframeworkdesktop-4.8)

Focus vs activation:
- [what is the difference between activate and got focus?-VBForums](https://www.vbforums.com/showthread.php?323192-what-is-the-difference-between-activate-and-got-focus)

[WPF and initial focus - Stack Overflow](https://stackoverflow.com/questions/817610/wpf-and-initial-focus)

```xaml
<Window FocusManager.FocusedElement="{Binding ElementName=SomeElement}">

   <DataGrid x:Name="SomeElement">
     ...
   </DataGrid>
</Window>
```