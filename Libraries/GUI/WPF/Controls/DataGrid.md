# DataGrid
Requiring .NET Framework 4.0.

## Data virtualization
[The DevZest Blog | WPF Data Virtualization](http://web.archive.org/web/20180814144210/http://www.devzest.com:80/blog/post/WPF-Data-Virtualization.aspx)
- [WPF Data Virtualization - CodePlex Archive](http://web.archive.org/web/20210630224150/https://archive.codeplex.com/?p=datavirtualization)
  - [DevZest.DataVirtualization: Component for displaying and interacting a large data set in WPF application.](https://github.com/Chaoses-Ib/DevZest.DataVirtualization)

[How to sort data virtualized items in WPF](https://github.com/bstollnitz/old-wpf-blog/tree/master/64-DataVirtualizationFilteringSorting)
- [GioviQ/DataVirtualization](https://github.com/GioviQ/DataVirtualization)

[VirtualizingObservableCollection: .NET PCL With Virtualizing Observable Collection](https://github.com/anagram4wander/VirtualizingObservableCollection)

[WPF: Data Virtualization - CodeProject](https://www.codeproject.com/Articles/34405/WPF-Data-Virtualization)

[XAML Anti-Patterns: Virtualization](https://www.codemag.com/article/1407081/XAML-Anti-Patterns-Virtualization)

Paid:
- [Syncfusion: Data Virtualization in WPF DataGrid control](https://help.syncfusion.com/wpf/datagrid/data-virtualization)
- [ComponentOne: How to Load a Billion Rows in a WPF Datagrid](https://www.grapecity.com/blogs/how-to-load-a-billion-rows-in-a-wpf-datagrid)
- [DevExpress: Bind the WPF Data Grid to any Data Source with Virtual Sources](https://docs.devexpress.com/WPF/10803/controls-and-libraries/data-grid/bind-to-data/bind-to-any-data-source-with-virtual-sources)
- [Advanced WPF Data-Grid Control](https://www.devcomponents.com/dotnetbar-wpf/WPFDataGridControl.aspx)

## Sorting
The DataGrid features built-in sorting as long as you’re binding a collection that implements `IList` (such as the `List<T>` and `ObservableCollection<T>` collections).[^prowpf]

- [c# - How to disable multiple column sorting on a wpf DataGrid? - Stack Overflow](https://stackoverflow.com/questions/17746552/how-to-disable-multiple-column-sorting-on-a-wpf-datagrid)

  ```csharp
  private void ResultsDataGrid_Sorting(object sender, DataGridSortingEventArgs e)
  {
      if (Keyboard.IsKeyDown(Key.LeftShift) || Keyboard.IsKeyDown(Key.RightShift))
      {
          e.Handled = true;
      }
  }
  ```

- [wpf - How to add back the sort arrow after applying background of Column headers - Stack Overflow](https://stackoverflow.com/questions/4487786/how-to-add-back-the-sort-arrow-after-applying-background-of-column-headers)

## Selection
- [DataGrid.SelectedIndex](https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.webcontrols.datagrid.selectedindex?view=netframework-4.8)

- [DataGrid.ScrollIntoView](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.datagrid.scrollintoview)

  `ScrollIntoView` only accepts item, but not index. It will just do a linear search in the DataGrid most times, but may also call `CollectionView.IndexOf()` sometimes. `ScrollIntoView` actually has an overload that can specify index, but it is an internal method.

## ContextMenu
- `DataGrid.ContextMenuOpening` will be triggered when right-click on regions out of cells, including on column headers. And it may not change the selection in some case for unknown reason.

  A solution is to handle `ContextMenuOpening` on `DataGridCell`, and select the row manually via `DataGridRow.GetRowContainingElement((DataGridCell)sender).IsSelected`.

- `RowDoubleClick` 也会响应左键外的其它鼠标按键，可能会与 `ContextMenu` 冲突。

## Input
[Keyboard navigation and selection concepts in the DataGrid control - Windows Community Toolkit | Microsoft Learn](https://learn.microsoft.com/en-us/windows/communitytoolkit/controls/datagrid_guidance/keyboard_navigation_selection)


[^prowpf]: Pro WPF 4.5 in C#