# Trees
[Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/advanced/trees-in-wpf?view=netframeworkdesktop-4.8)

## Visual trees
A **visual tree** is an expanded version of the logical tree. It breaks elements down into smaller pieces.

The visual tree allows you to do two useful things:

- You can alter one of the elements in the visual tree by using styles. You can select the specific element you want to modify by using the `Style.TargetType` property. You can even use triggers to make changes automatically when control properties change. However, certain details are difficult or impossible to modify.
- You can create a new template for your control. In this case, your control template will be used to build the visual tree exactly the way you want it.

## Binding elements out of trees
Dependency properties 的查找依赖于 logical tree，而 `DataGridColumn` 不在 logical tree 中，因此 `DataGridColumn` 即使使用 FindAncestor 也无法查找到 dependency properties，只能通过 binding proxy 来间接查找[^binding-proxy-so][^binding-proxy-so2][^binding-proxy-so3][^binding-proxy-so4]：

```xaml
<DataGrid.Resources>
    <local:BindingProxy x:Key="DataContextBindingProxy" Data="{Binding RelativeSource={RelativeSource TemplatedParent}}"/> 
</DataGrid.Resources>
<DataGrid.Columns>
    <DataGridTemplateColumn>
        <DataGridTemplateColumn.CellTemplate 
            MaxWidth="{Binding Path=Data.MaxWidthIdentifier, Source={StaticResource DataContextBindingProxy}}"
            CellTemplate="{Binding Path=Data.MaxWidthIdentifier, Source={StaticResource PropertiesDataTemplate}}"/>
    </DataGridTemplateColumn>
</DataGrid.Columns>
```

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

[\[WPF\] How to bind to data when the DataContext is not inherited - Thomas Levesque's .NET Blog](https://thomaslevesque.com/2011/03/21/wpf-how-to-bind-to-data-when-the-datacontext-is-not-inherited/)

[x:Reference Markup Extension - XAML | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/xaml-services/xreference-markup-extension)


[^binding-proxy-so]: [wpf - Cannot find source for binding with reference in nested Style / DataGrid DataTemplates - Stack Overflow](https://stackoverflow.com/questions/59967164/cannot-find-source-for-binding-with-reference-in-nested-style-datagrid-datatem)
[^binding-proxy-so2]: [c# - How to hide wpf datagrid columns depending on a property - Stack Overflow](https://stackoverflow.com/questions/6857780/how-to-hide-wpf-datagrid-columns-depending-on-a-property)
[^binding-proxy-so3]: [c# - Cannot find source for binding with reference 'RelativeSource FindAncestor' - Stack Overflow](https://stackoverflow.com/questions/15494226/cannot-find-source-for-binding-with-reference-relativesource-findancestor)
[^binding-proxy-so4]: [c# - Binding datagrid column width - Stack Overflow](https://stackoverflow.com/questions/9313586/binding-datagrid-column-width)