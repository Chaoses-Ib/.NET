# TreeView
```xaml
<TreeView>
  <TreeViewItem Header="Fruit">
    <TreeViewItem Header="Orange"/>
    <TreeViewItem Header="Banana"/>
    <TreeViewItem Header="Grapefruit"/>
  </TreeViewItem>
 <TreeViewItem Header="Vegetables">
    <TreeViewItem Header="Aubergine"/>
    <TreeViewItem Header="Squash"/>
    <TreeViewItem Header="Spinach"/>
  </TreeViewItem>
</TreeView>
```

[TreeViewEx: Extremly helpful classes to handle the WPF TreeView](https://github.com/Anapher/TreeViewEx)

## Data binding
[^prowpf]

Data:
```csharp
public class Category : INotifyPropertyChanged
{
    private string categoryName;
    public string CategoryName
    {
        get { return categoryName; }
        set { categoryName = value;
              OnPropertyChanged(new PropertyChangedEventArgs("CategoryName"));
            }
    }

    private ObservableCollection<Product> products;
    public ObservableCollection<Product> Products
    {
        get { return products; }
        set { products = value;
              OnPropertyChanged(new PropertyChangedEventArgs("Products"));
        }
    }

    public event PropertyChangedEventHandler PropertyChanged;
    public void OnPropertyChanged(PropertyChangedEventArgs e)
    {
        if (PropertyChanged != null)
            PropertyChanged(this, e);
    }

    public Category(string categoryName, ObservableCollection<Product> products)
    {
        CategoryName = categoryName;
        Products = products;
    }
}
```

Data template:
```xaml
<TreeView Name="treeCategories" Margin="5">
  <TreeView.ItemTemplate>
    <HierarchicalDataTemplate ItemsSource="{Binding Path=Products}">
      <TextBlock Text="{Binding Path=CategoryName}" />
      <HierarchicalDataTemplate.ItemTemplate>
        <DataTemplate>
          <TextBlock Text="{Binding Path=ModelName}" />
        </DataTemplate>
      </HierarchicalDataTemplate.ItemTemplate>
    </HierarchicalDataTemplate>
  </TreeView.ItemTemplate>
</TreeView>
```
or:
```xaml
<Window x:Class="DataBinding.BoundTreeView" ...
    xmlns:local="clr-namespace:DataBinding">
  <Window.Resources>
    <HierarchicalDataTemplate DataType="{x:Type local:Category}"
     ItemsSource="{Binding Path=Products}">
      <TextBlock Text="{Binding Path=CategoryName}"/>
    </HierarchicalDataTemplate>

    <HierarchicalDataTemplate DataType="{x:Type local:Product}">
      <TextBlock Text="{Binding Path=ModelName}" />
    </HierarchicalDataTemplate>
  </Window.Resources>

  <Grid>
    <TreeView Name="treeCategories" Margin="5">
    </TreeView>
  </Grid>
</Window>
```

## Expanding
[Expanding All Nodes in a TreeView by Default | 2,000 Things You Should Know About WPF](https://wpf.2000things.com/2017/09/28/1219-expanding-all-nodes-in-a-treeview-by-default/)
```xaml
<Style x:Key="TreeViewItemStyle_ExpandAll" TargetType="{x:Type TreeViewItem}">
    <Setter Property="IsExpanded" Value="True"/>
</Style>

<TreeView Grid.Row="0" Margin="5"
          ItemsSource="{Binding Breeds}"
          ItemContainerStyle="{StaticResource TreeViewItemStyle_ExpandAll}"
          HorizontalContentAlignment="Stretch">
```

## Selection
[wpf - Customizing the TreeView to allow multi select - Stack Overflow](https://stackoverflow.com/questions/459375/customizing-the-treeview-to-allow-multi-select)
- [MultiSelectTreeView control -- unclassified software development](https://unclassified.software/en/source/multiselecttreeview) ([GitHub](https://github.com/ygoe/MultiSelectTreeView))

## Context menu
在 TreeView 中，右键单击项目不会导致相应项目被选中，这意味着如果为不同的项目设置了不同的 ContextMenu，那么 TreeView.SelectedItem 获取到的将会是错误的项目。这个问题可以通过两种方法解决：

- 在右键单击时选中相应项目

  ```csharp
  private void OnPreviewMouseRightButtonDown(object sender, MouseButtonEventArgs e)
  {
      TreeViewItem treeViewItem = VisualUpwardSearch(e.OriginalSource as DependencyObject);
  
      if (treeViewItem != null)
      {
          treeViewItem.Focus();
          e.Handled = true;
      }
  }
  
  static TreeViewItem VisualUpwardSearch(DependencyObject source)
  {
      while (source != null && !(source is TreeViewItem))
          source = VisualTreeHelper.GetParent(source);
  
      return source as TreeViewItem;
  }
  ```
  
  [wpf - Select TreeView Node on right click before displaying ContextMenu - Stack Overflow](https://stackoverflow.com/questions/592373/select-treeview-node-on-right-click-before-displaying-contextmenu)

- 根据 SelectedItem 决定要显示的 ContextMenu


[^prowpf]: Pro WPF 4.5 in C#