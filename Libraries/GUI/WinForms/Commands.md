# Commands
[WM\_COMMAND message (Winuser.h) - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/menurc/wm-command)

- WinForms uses command ids range from 0x100 to 0x10000.
- `AssignID` assigns command ids with a static command array and a static sync object.
- `System.Windows.Forms.Command` is an internal class.
  - You can send `WM_COMMAND` to any `Control`, `Form` or `NotifyIcon` to invoke the command via `DispatchID`.
- `Dispose` a command will remove it from the command array.
  - But the current id will not be reset. This means if you create and dispose commands frequently, the command id will eventually overflow.
  - Before disposing a command, one should call `Application.DoEvents()` to process existing `WM_COMMAND`, otherwise the command will not be invoked. This can happen if `TrackPopupMenuEx` is used to show the menu.