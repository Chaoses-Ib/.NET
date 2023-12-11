# TextBox
[The TextBox control - The complete WPF tutorial](https://wpf-tutorial.com/basic-controls/the-textbox-control/)

- [WPF AutoComplete TextBox: An autocomplete TextBox for WPF](https://github.com/quicoli/WPF-AutoComplete-TextBox)

## Cue banners
```xaml
<Grid>
  <TextBlock Grid.Column="0"
             Text="Cue banner"
             Visibility="{Binding ElementName=MyTextBox, Path=Text.IsEmpty, Converter={StaticResource BooleanToVisibilityConverter}}" />
  <TextBox x:Name="MyTextBox" Grid.Column="0" />
</Grid>
```
The `TextBlock` must be placed before the `TextBox`, otherwise the cursor will be `Arrow` instead of `IBeam`.

## Input
[WPF TextBox ignores/overrides certain keyboard input combinations - Issue #8249 - dotnet/wpf](https://github.com/dotnet/wpf/issues/8249)