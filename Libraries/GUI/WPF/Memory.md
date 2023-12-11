# Memory Management
- Binding leak

  [c# - Can bindings create memory leaks in WPF? - Stack Overflow](https://stackoverflow.com/questions/18542940/can-bindings-create-memory-leaks-in-wpf)

  > If you are not binding to a `DependencyProperty` or a object that implements `INotifyPropertyChanged` then the binding can leak memory, and you will have to unbind when you are done.

- Collection binding leak
- Textbox undo leak
- Event Handler leak
  - [VirtualizingStackPanel](Layouts/StackPanel.md#virtualizingstackpanel)
- `x:Name` leak

[Fighting Common WPF Memory Leaks with dotMemory | The .NET Tools Blog](https://blog.jetbrains.com/dotnet/2014/09/04/fighting-common-wpf-memory-leaks-with-dotmemory/)