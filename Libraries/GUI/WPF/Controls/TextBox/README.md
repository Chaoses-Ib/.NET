# TextBox
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