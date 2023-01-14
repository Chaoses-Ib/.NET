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

## Binding modes
[^prowpf]

Name | Description
--- | ---
OneWay | The target property is updated when the source property changes.
TwoWay | The target property is updated when the source property changes, and the source property is updated when the target property changes.
OneTime | The target property is set initially based on the source property value. However, changes are ignored from that point onward (unless the binding is set to a completely different object or you call `BindingExpression.UpdateTarget()`). Usually, you'll use this mode to reduce overhead if you know the source property won't change.
OneWayToSource | Similar to OneWay but in reverse. The source property is updated when the target property changes (which might seem a little backward), but the target property is never updated.
Default | The type of binding depends on the target property. It's either TwoWay (for user-settable properties, such as the `TextBox.Text`) or OneWay (for everything else). All bindings use this approach unless you specify otherwise.

## Binding errors
WPF 会无视异常：
- Path 不存在时 WPF 不会抛出异常，不过调试时会在 Output 中输出。
- WPF 会忽略读取属性时抛出的异常，转换失败的异常也会被忽略。
- 不过可以设置读取失败时的显示内容。

[^prowpf]: Pro WPF 4.5 in C#