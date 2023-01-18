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

## Binding proxy
Dependency properties 的查找依赖于 logical tree，而 template 不在 logical tree 中，因此 template 即使使用 FindAncestor 也无法查找到 dependency properties，只能通过 binding proxy 来间接查找[^binding-proxy-so]：
```csharp
public class BindingProxy : Freezable
{
    public static readonly DependencyProperty DataProperty =
        DependencyProperty.Register(nameof(Data), typeof(object), typeof(BindingProxy));

    public object Data
    {
        get => GetValue(DataProperty);
        set => SetValue(DataProperty, value);
    }

    protected override Freezable CreateInstanceCore()
    {
        return new BindingProxy();
    }
}
```
```xaml
<DataGrid.Resources>
    <local:BindingProxy x:Key="DataContextBindingProxy" Data="{Binding RelativeSource={RelativeSource TemplatedParent}}"/> 
</DataGrid.Resources>
<DataGrid.Columns>
    <DataGridTemplateColumn>
        <DataGridTemplateColumn.CellTemplate 
            MaxWidth="{Binding Path=Data.MaxWidthIdentifier, Source={StaticResource DataContextBindingProxy}}"
            CellTemplate="{Binding Path=Data.MaxWidthIdentifier, Source={StaticResource PropertiesDataTemplate}"/>
    </DataGridTemplateColumn>
</DataGrid.Columns>
```

[^binding-proxy-so]: [wpf - Cannot find source for binding with reference in nested Style / DataGrid DataTemplates - Stack Overflow](https://stackoverflow.com/questions/59967164/cannot-find-source-for-binding-with-reference-in-nested-style-datagrid-datatem)