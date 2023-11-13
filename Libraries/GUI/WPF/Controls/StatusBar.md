# StatusBar
[The WPF StatusBar control - The complete WPF tutorial](https://wpf-tutorial.com/common-interface-controls/statusbar-control/)

```xaml
<Window x:Class="WpfTutorialSamples.Common_interface_controls.StatusBarAdvancedSample"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="StatusBarAdvancedSample" Height="150" Width="400">
    <DockPanel>
        <StatusBar DockPanel.Dock="Bottom">
            <StatusBar.ItemsPanel>
                <ItemsPanelTemplate>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="100" />
                            <ColumnDefinition Width="Auto" />
                            <ColumnDefinition Width="*" />
                            <ColumnDefinition Width="Auto" />
                            <ColumnDefinition Width="100" />
                        </Grid.ColumnDefinitions>
                    </Grid>
                </ItemsPanelTemplate>
            </StatusBar.ItemsPanel>
            <StatusBarItem>
                <TextBlock Name="lblCursorPosition" />
            </StatusBarItem>
            <Separator Grid.Column="1" />
            <StatusBarItem Grid.Column="2">
                <TextBlock Text="c:\path\of\current\file.txt" />
            </StatusBarItem>
            <Separator Grid.Column="3" />
            <StatusBarItem Grid.Column="4">
                <ProgressBar Value="50" Width="90" Height="16" />
            </StatusBarItem>
        </StatusBar>
        <TextBox AcceptsReturn="True" Name="txtEditor" SelectionChanged="txtEditor_SelectionChanged" />
    </DockPanel>
</Window>
```

`StatusBarItem` has a default padding of `3`.