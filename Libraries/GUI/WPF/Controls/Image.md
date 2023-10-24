# Image
## Icons
- [MahApps.Metro.IconPacks: Awesome icon packs for WPF and UWP in one library](https://github.com/MahApps/MahApps.Metro.IconPacks)
  - [`PackIconControl`](https://github.com/MahApps/MahApps.Metro.IconPacks/wiki/Usage#packicon-controls)
  - [MarkupExtensions](https://github.com/MahApps/MahApps.Metro.IconPacks/wiki/MarkupExtensions): `{iconPacks:FontAwesome SpinnerSolid, Width=32, Height=32, Spin=True, SpinDuration=3}`
  - [ImageConverter](https://github.com/MahApps/MahApps.Metro.IconPacks/wiki/ImageConverter): `{Binding ElementName=PackIconFontAwesomeKinds, Path=SelectedItem, Converter={iconPacks:PackIconKindToImageConverter Brush=Crimson}}`

    `Brush` can also be specified through `ConverterParameter`, but neither supports using a binding. To use a brush binding, one need to make a converter with `IMultiValueConverter`.