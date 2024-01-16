# Commands
[Commanding Overview - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/advanced/commanding-overview?view=netframeworkdesktop-4.8)

WPF allows you to define **commands** and connect controls to them so you don’t need to write repetitive event-handling code. Even more important, the command feature manages the state of your user interface by automatically disabling controls when the linked commands aren’t available. It also gives you a central place to store (and localize) the text captions for your commands.

The WPF command system is a great tool for simplifying application design. However, it still has some fairly significant gaps. Notably, WPF doesn’t have any support for the following:[^prowpf]
- Command tracking (for example, keeping a history of recent
commands)
- Undoable commands
- Commands that have state and can be in different modes (for example,
a command that can be toggled on or off)

[Introduction to WPF Commands - The complete WPF tutorial](https://wpf-tutorial.com/commands/introduction/)
- [Using WPF commands - The complete WPF tutorial](https://wpf-tutorial.com/commands/using-commands/)

## [`ICommand`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.icommand)
```csharp
public interface ICommand
{
    void Execute(object parameter);
    bool CanExecute(object parameter);

    event EventHandler CanExecuteChanged;
}
```

- `null` is considered an *executable* command.
- Hide if the command cannot be executed

  ```xaml
  Visibility="{Binding RelativeSource={RelativeSource Self}, Path=IsEnabled, Converter={StaticResource BooleanToVisibilityConverter}}"
  ```
  or:
  ```xaml
  <Button.Style>
      <Style TargetType="{x:Type Button}" >
          <Style.Triggers>
              <Trigger Property="IsEnabled" Value="False">
                  <Setter Property="Visibility" Value="Collapsed" />
              </Trigger>
          </Style.Triggers>
      </Style>
  </Button.Style>
  ```

  [wpf - how to hide a button that is bound to a command that cannot execute? - Stack Overflow](https://stackoverflow.com/questions/3945026/how-to-hide-a-button-that-is-bound-to-a-command-that-cannot-execute)

## [`RoutedCommand`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.routedcommand)
```csharp
public void Execute(object parameter, IInputElement target);
public bool CanExecute(object parameter, IInputElement target);
```

The `RoutedCommand` class adds a fair bit of extra infrastructure for event tunneling and bubbling. Whereas the `ICommand` interface encapsulates the idea of a command—an action that can be triggered and may or may not be enabled—the `RoutedCommand` modifies the command so that it can bubble through the WPF element hierarchy to get to the correct event handler.

`RoutedCommand` makes **prebuilt commands** possible. These command classes don’t contain any real code. They’re just conveniently defined objects that represent a common application task (such as printing a document). To act on these commands, you need to use a **command binding**, which raises an event to your code.[^prowpf]

## [`RoutedUICommand`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.routeduicommand)
Most of the commands you’ll deal with won’t be `RoutedCommand` objects; rather, they will be instances of the `RoutedUICommand` class, which derives from `RoutedCommand`.

`RoutedUICommand` is intended for commands with text that is displayed somewhere in the user interface. The RoutedUICommand class adds a single
property—`Text`—which is the display text for that command.

You can modify the Text property of a command before you bind it in a window (for example, using code in the constructor of your window or application class). Because commands are static objects that are global to your entire application, changing the text affects the command everywhere it appears in your user interface. Unlike the `Text` property, the `Name` property cannot be modified.[^prowpf]

## Command library
WPF includes a basic command library that’s stocked with more than 100 commands. These commands are exposed through the static properties of five dedicated static classes:

- [`ApplicationCommands`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.applicationcommands): This class provides the common commands, including clipboard commands (such as `Copy`, `Cut`, and `Paste`) and document commands (such as `New`, `Open`, `Save`, `SaveAs`, `Print`, and so on).
  - [`NotACommand`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.applicationcommands.notacommand?view=windowsdesktop-8.0)
  - When routed to a `TextBox`, `Copy` can only be executed if any text is selected by the user.

- [`NavigationCommands`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.navigationcommands): This class provides commands used for navigation, including some that are designed for page-based applications (such as `BrowseBack`, `BrowseForward`, and `NextPage`) and others that are suitable for document-based applications (such as `IncreaseZoom` and `Refresh`).

- [`EditingCommands`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.documents.editingcommands): This class provides a long list of mostly document-editing commands, including commands for moving around (`MoveToLineEnd`, `MoveLeftByWord`, `MoveUpByPage`, and so on), selecting content (`SelectToLineEnd`, `SelectLeftByWord`), and changing formatting (`ToggleBold` and `ToggleUnderline`).

- [`ComponentCommands`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.componentcommands): This includes commands that are used by user-interface components, including commands for moving around and selecting content that are similar to (and even duplicate) some of the commands in the `EditingCommands` class.

- [`MediaCommands`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.input.mediacommands): This class includes a set of commands for dealing with multimedia (such as `Play`, `Pause`, `NextTrack`, and `IncreaseVolume`).

These individual command objects are just markers with no real functionality. However, many of the command objects have one extra feature: default input bindings. For example, the `ApplicationCommands.Open` command is mapped to the keystroke `Ctrl+O`. As soon as you bind that command to a command source and add that command source to a window, the key combination becomes active, even if the command doesn’t appear anywhere in the user interface.[^prowpf]

## `RelayCommand`
The `RelayCommand` are `ICommand` implementations that can expose a method or delegate to the view. These types act as a way to bind commands between the viewmodel and UI elements.

- [RelayCommand - Community Toolkits for .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/communitytoolkit/mvvm/relaycommand)


[^prowpf]: Pro WPF 4.5 in C#