# Dependency Properties
```csharp
public class Student : DependencyObject
{
    public static readonly DependencyProperty NameProperty =
        DependencyProperty.Register("Name", typeof(string), typeof(Student));

    public string Name
    {
        get => (string)GetValue(NameProperty);
        set => SetValue(NameProperty, value);
    }
}
```
DependencyObject 实现了 INotifyPropertyChanged。

[PropertyChanged.Fody: Injects INotifyPropertyChanged code into properties at compile time](https://github.com/Fody/PropertyChanged)

## Value precedence
[Dependency property value precedence - WPF .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/properties/dependency-property-value-precedence?view=netdesktop-7.0)

[c# - WPF Style DataTrigger with binding to DataContext not working - Stack Overflow](https://stackoverflow.com/questions/19319215/wpf-style-datatrigger-with-binding-to-datacontext-not-working)

> Dependency Properties can be set from many different places; inline, animations, coercion, triggers, etc. As such a [Dependency Property Value Precedence](https://learn.microsoft.com/en-us/dotnet/framework/wpf/advanced/dependency-property-value-precedence) list was created and this dictates which changes override which other changes. Because of this order of precedence, we can't use a `Trigger` to update a property that is explicitly set inline in your XAML. Try this instead:
> ```xaml
> <Grid>
>     <TextBlock>
>         <TextBlock.Style>
>             <Style BasedOn="{StaticResource TextStyle}" TargetType="TextBlock">
>                 <!-- define your default value here -->
>                 <Setter Property="Text" Value="Foo" />
>                 <Style.Triggers>
>                     <DataTrigger Binding="{Binding MyBool}" Value="True">
>                         <!-- define your triggered value here -->
>                         <Setter Property="Text" Value="Bar" />
>                     </DataTrigger>
>                  </Style.Triggers>
>              </Style>
>          </TextBlock.Style>
>      </TextBlock>
> </Grid>
> ```