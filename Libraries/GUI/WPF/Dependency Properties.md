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