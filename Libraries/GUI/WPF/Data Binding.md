# Data Binding
```csharp
class Student : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    private string name;

    public string Name
    {
        get => name;
        set
        {
            name = value;
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Name"));
        }
    }
}

textBoxName.SetBinding(TextBox.TextProperty, new Binding("Name") { Source = stu = new Student() });
```

- [CalcBinding: Advanced WPF Binding which supports expressions in Path property and other features](https://github.com/Alex141/CalcBinding)
  - Logical operators cannot be used between `bool` and `Visibility`.

## Binding modes
[^prowpf]

Name | Description
--- | ---
OneWay | The target property is updated when the source property changes.
TwoWay | The target property is updated when the source property changes, and the source property is updated when the target property changes.
OneTime | The target property is set initially based on the source property value. However, changes are ignored from that point onward (unless the binding is set to a completely different object or you call `BindingExpression.UpdateTarget()`). Usually, you'll use this mode to reduce overhead if you know the source property won't change.
OneWayToSource | Similar to OneWay but in reverse. The source property is updated when the target property changes (which might seem a little backward), but the target property is never updated.
Default | The type of binding depends on the target property. It's either TwoWay (for user-settable properties, such as the `TextBox.Text`) or OneWay (for everything else). All bindings use this approach unless you specify otherwise.

- [Binding.UpdateSourceTrigger](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.binding.updatesourcetrigger?view=netframework-4.8)

  Bindings that are [TwoWay](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.bindingmode?view=netframework-4.8#system-windows-data-bindingmode-twoway) or [OneWayToSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.bindingmode?view=netframework-4.8#system-windows-data-bindingmode-onewaytosource) listen for changes in the target property and propagate them back to the source. This is known as updating the source. Usually, these updates happen whenever the target property changes. This is fine for check boxes and other simple controls, but it is usually not appropriate for text fields. Updating after every keystroke can diminish performance and it denies the user the usual opportunity to backspace and fix typing errors before committing to the new value. Therefore, the default [UpdateSourceTrigger](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.binding.updatesourcetrigger?view=netframework-4.8) value of the [Text](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.textbox.text?view=netframework-4.8) property is [LostFocus](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.updatesourcetrigger?view=netframework-4.8#system-windows-data-updatesourcetrigger-lostfocus) and not [PropertyChanged](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.updatesourcetrigger?view=netframework-4.8#system-windows-data-updatesourcetrigger-propertychanged).

  If you set the [UpdateSourceTrigger](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.binding.updatesourcetrigger?view=netframework-4.8) value to [Explicit](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.updatesourcetrigger?view=netframework-4.8#system-windows-data-updatesourcetrigger-explicit), you must call the [UpdateSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.bindingexpression.updatesource?view=netframework-4.8) method or the changes will not propagate back to the source.

## Binding errors
WPF 会无视异常：
- Path 不存在时 WPF 不会抛出异常，不过调试时会在 Output 中输出。
- WPF 会忽略读取属性时抛出的异常，转换失败的异常也会被忽略。
- 不过可以设置读取失败时的显示内容。

[Debugging data bindings - The complete WPF tutorial](https://wpf-tutorial.com/data-binding/debugging/)

```xaml
<Window x:Class="WpfTutorialSamples.DataBinding.DataBindingDebuggingSample"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:diag="clr-namespace:System.Diagnostics;assembly=WindowsBase"
        Title="DataBindingDebuggingSample" Height="100" Width="200">
    <Grid Margin="10">
		<TextBlock Text="{Binding Title, diag:PresentationTraceSources.TraceLevel=High}" />
	</Grid>
</Window>
```

- 在需要 `TwoWay` 的 property 上使用 `OneWay` 可能会导致 binding 异常失效

  ```csharp
  System.Windows.Data Warning: 75 : BindingExpression (hash=52697953): Deactivate
  System.Windows.Data Warning: 99 : BindingExpression (hash=52697953): Replace item at level 0 with {NullDataItem}
  System.Windows.Data Warning: 59 : BindingExpression (hash=52697953): Detach
  ```

  使用 `Mode=TwoWay, UpdateSourceTrigger=Explicit` 可以解决。

  [wpf - Why does data binding break in OneWay mode? - Stack Overflow](https://stackoverflow.com/questions/1389038/why-does-data-binding-break-in-oneway-mode)

## [StringFormat](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.bindingbase.stringformat?view=netframework-4.8)
Binding:
- Do the formatting in the view model[^stringformat-1]

- `MultiBinding` with a custom converter[^stringformat-2]

  ```csharp
  public class FormatStringConverter : IMultiValueConverter
  {
      public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
      {
          if (values[0] == DependencyProperty.UnsetValue || values[0] == null)
              return String.Empty;

          var format = (string)values[0];
          var args = values.Where((o, i) => { return i != 0; }).ToArray();

          return String.Format(format, args);
      }

      public object[] ConvertBack(object value, Type[] targetTypes, object parameter, System.Globalization.CultureInfo culture)
      {
          throw new NotImplementedException();
      }
  }
  ```

  ```xaml
  <TextBlock ap:Localization.Resource="SomeKey">
      <TextBlock.Text>
          <MultiBinding Converter="{StaticResource formatStringConverter}">
              <Binding Path="(ap:Localization.Resource)" RelativeSource="{RelativeSource Self}" />
              <Binding Path="Id" />
          </MultiBinding>
      </TextBlock.Text>
  </TextBlock>
  ```


[^prowpf]: Pro WPF 4.5 in C#
[^stringformat-1]: [wpf - Binding StringFormat - Stack Overflow](https://stackoverflow.com/questions/4010772/binding-stringformat)
[^stringformat-2]: [c# - WPF Localization: DynamicResource with StringFormat? - Stack Overflow](https://stackoverflow.com/questions/30925145/wpf-localization-dynamicresource-with-stringformat)