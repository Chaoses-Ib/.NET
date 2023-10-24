# Graphics
[Graphics and Multimedia - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/graphics-multimedia/)

## Geometries vs shapes
The `Geometry` class inherits from the `Freezable` class while the `Shape` class inherits from `FrameworkElement`. Because they are elements, Shape objects can render themselves and participate in the layout system, while `Geometry` objects cannot.

Although `Shape` objects are more readily usable than `Geometry` objects, `Geometry` objects are more versatile. While a `Shape` object is used to render 2D graphics, a `Geometry` object can be used to define the geometric region for 2D graphics, define a region for clipping, or define a region for hit testing, for example.

## SVG
[WPF What is the correct way of using SVG files as icons in WPF - Stack Overflow](https://stackoverflow.com/questions/3526366/wpf-what-is-the-correct-way-of-using-svg-files-as-icons-in-wpf)
- [SvgToXaml: Smart Tool to view svg-files and convert them to xaml for use in .NET](https://github.com/BerndK/SvgToXaml)