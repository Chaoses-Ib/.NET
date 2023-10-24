# Data Conversion
How to pass the value of a property to a converter?
- `IMultiValueConverter`

  For example:
  ```xaml
  <ContentControl>
    <ContentControl.Resources>
        <DataTemplate DataType="{x:Type views:Icon}">
          <Image>
            <Image.Source>
              <MultiBinding Converter="{converters:IconIdToImageConverter}">
                <Binding Path="Id" />
                <Binding Path="Foreground" RelativeSource="{RelativeSource FindAncestor, AncestorType={x:Type ContentControl}}" />
              </MultiBinding>
            </Image.Source>
          </Image>
      </DataTemplate>
    </ContentControl.Resources>
  </ContentControl>
  ```

  [wpf - how to pass value to converter which is a Property in the element which was bound - Stack Overflow](https://stackoverflow.com/questions/9602410/how-to-pass-value-to-converter-which-is-a-property-in-the-element-which-was-boun)

  [wpf - Binding ConverterParameter - Stack Overflow](https://stackoverflow.com/questions/15309008/binding-converterparameter)

  [WPF: How to pass a control's property as a parameter when binding? : csharp](https://www.reddit.com/r/csharp/comments/5dmzfs/wpf_how_to_pass_a_controls_property_as_a/)

## Converters
- [BooleanToVisibilityConverter](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.booleantovisibilityconverter)

  [.net - How do I invert BooleanToVisibilityConverter? - Stack Overflow](https://stackoverflow.com/questions/534575/how-do-i-invert-booleantovisibilityconverter)