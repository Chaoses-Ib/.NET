# ListBox
[.net - What is The difference between ListBox and ListView - Stack Overflow](https://stackoverflow.com/questions/4703641/what-is-the-difference-between-listbox-and-listview)

> A `ListView` is basically like a `ListBox` (and inherits from it), but it also has a `View` property. This property allows you to specify a predefined way of displaying the items. The only predefined view in the BCL is `GridView`, but you can easily [create your own](http://msdn.microsoft.com/en-us/library/ms748859.aspx).
> 
> Another difference is the default selection mode: it's `Single` for a `ListBox`, but `Extended` for a `ListView`

## Values
`ListBox` does not support attach values to `ListBoxItem`.

[c# - ListBoxItem with value? - Stack Overflow](https://stackoverflow.com/questions/3414456/listboxitem-with-value)

## Template
[ListBox Styles and Templates - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/controls/listbox-styles-and-templates?view=netframeworkdesktop-4.8)

> The [ItemTemplate](http://msdn.microsoft.com/en-us/library/system.windows.controls.itemscontrol.itemtemplate.aspx) is for styling how the content of your data item appears. You use it to bind data fields, format display strings, and so forth. It determines how the data is presented.
> 
> The [ItemContainerStyle](http://msdn.microsoft.com/en-us/library/system.windows.controls.itemscontrol.itemcontainerstyle.aspx) is for styling the container of the data item. In a list box, this would be a ListBoxItem. Styling here affects things like selection behavior or background color. It determines style and UX of the display.

[What's the difference between ItemTemplate and ItemContainerStyle in a WPF ListBox? - Stack Overflow](https://stackoverflow.com/questions/16546143/whats-the-difference-between-itemtemplate-and-itemcontainerstyle-in-a-wpf-listb)