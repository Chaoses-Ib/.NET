# Menu
- [Menu](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.menu?view=netframework-4.8.1)
  - [MainMenu](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.mainmenu?view=netframework-4.8.1)
  - [ContextMenu](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.contextmenu?view=netframework-4.8.1)
- ToolStrip
  - [MenuStrip](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.menustrip)
  - [ToolStripDropDown](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstripdropdown)
    - [ToolStripDropDownMenu](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstripdropdownmenu)
      - [ContextMenuStrip](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.contextmenustrip)

## Menu
[GetMenuItemInfoW](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmenuiteminfow)
- Not only `cch`, but also `dwTypeData` may be reset by `GetMenuItemInfo`.
- `fMask` cannot be set to `0xFFFFFFFF` since `MIIM_TYPE` cannot be used with `MIIM_BITMAP`, `MIIM_FTYPE` and `MIIM_STRING`. Use `0x1EF` instead.

Separator: `new MenuItem("-")`

### Icon
[.net - How to add an icon to System.Windows.Forms.MenuItem? - Stack Overflow](https://stackoverflow.com/questions/10671585/how-to-add-an-icon-to-system-windows-forms-menuitem)

- [VistaMenu](https://wyday.com/vistamenu/)

  [Making the menus in your .NET app look professional](https://wyday.com/blog/2009/making-the-menus-in-your-net-app-look-professional/)

- SetMenuItemInfo

- OwnerDraw

  [Putting Images Next To MenuItems In A Menu in C# - CodeProject](https://www.codeproject.com/Articles/4332/Putting-Images-Next-To-MenuItems-In-A-Menu-in-C)

- ContextMenuStrip

[winapi - Getting the width of the icon area of a context menu - Stack Overflow](https://stackoverflow.com/questions/5830600/getting-the-width-of-the-icon-area-of-a-context-menu)
- `GetSystemMetrics(SM_CXMENUCHECK)`
- `GetSystemMetrics(SM_CXICON)` ?

## ContextMenuStrip
- `ContextMenuStrip` is just a conceptual wrapper around `ToolStripDropDownMenu`.
- `ToolStripDropDownMenu` has an internal method `FromHMenu` that can wrap a native menu.