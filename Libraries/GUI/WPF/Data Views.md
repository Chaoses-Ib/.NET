# Data Views
[ICollectionView](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.icollectionview)

- [CollectionView](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview)

  The `CollectionView` offers poor performance for large items and operations that modify the data source (such as insertions and deletions).[^prowpf]

  When you set the [Filter](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview.filter), [SortDescriptions](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview.sortdescriptions), or [GroupDescriptions](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview.groupdescriptions) property; a refresh occurs. You do not have to call the [Refresh](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview.refresh) method immediately after you set one of those properties. For information about how to delay automatic refresh, see [DeferRefresh](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionview.deferrefresh).

  - [ListCollectionView](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.listcollectionview)

- [DevZest.DataVirtualization: Component for displaying and interacting a large data set in WPF application.](https://github.com/Chaoses-Ib/DevZest.DataVirtualization)

[CollectionViewSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.collectionviewsource), [ICollectionViewFactory](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.icollectionviewfactory)

## Filtering
[How to apply filters in wpf treeview using collectionview type sources?](https://github.com/SyncfusionExamples/How-to-apply-filters-in-wpf-treeview-using-collectionview-type-sources)

## Sorting
- [UsesLocalArray](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.listcollectionview.useslocalarray)

  `true` if a private copy of the data is needed for sorting and filtering; otherwise, `false`. The default implementation returns `true` if there is an [ActiveFilter](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.listcollectionview.activefilte) or [ActiveComparer](https://learn.microsoft.com/en-us/dotnet/api/system.windows.data.listcollectionview.activecomparer), or both.

- `ActiveComparer` is set by `RefreshOverride/RebuildLocalArray -> PrepareLocalArray -> PrepareShaping -> PrepareComparer`.

[Override sorting in WPF DataGrid / ListCollectionView - Stack Overflow](https://stackoverflow.com/questions/4399995/override-sorting-in-wpf-datagrid-listcollectionview)

## Live shaping
Live shaping watches for changes in specific properties. If it detects a change and determines that the change affects the current view, it triggers a refresh. To use live shaping, you need to meet three criteria[^prowpf] :
- Your data object must implement `INotifyPropertyChanged`. It uses this interface to signal when its properties change.
- Your collection must implement `ICollectionViewLiveShaping`. The standard `ListCollectionView` and `BindingListCollectionView` classes both implement `ICollectionViewLiveShaping`.
- You must explicitly enable live shaping. You do this by setting several properties on the `ListCollectionView` or `BindingListCollectionView` object.

  Live shaping adds extra overhead, so you need to opt-it to this feature when you need it. You do that with three separate properties:
  - `IsLiveFiltering`
  - `IsLiveSorting`
  - `IsLiveGrouping`

After you’ve enabled live shaping, you also need to tell the collection what properties to monitor. You do that by adding the property name (as a string) to one of three collection properties:
- `LiveFilteringProperties`
- `LiveSortingProperties`
- `LiveGroupingProperties`


[^prowpf]: Pro WPF 4.5 in C#