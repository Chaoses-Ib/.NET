# Styles
[How to set a default Margin for all the controls on all my WPF windows? - Stack Overflow](https://stackoverflow.com/questions/8995678/how-to-set-a-default-margin-for-all-the-controls-on-all-my-wpf-windows)
```xaml
<Window x:Class="WpfApplication7.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="MainWindow" Height="350" Width="525">
    <Window.Resources>
        <!-- One style for each *type* of control on the window -->
        <Style TargetType="TextBox">
            <Setter Property="Margin" Value="10"/>
        </Style>
        <Style TargetType="TextBlock">
            <Setter Property="Margin" Value="10"/>
        </Style>
    </Window.Resources>
    <StackPanel>
        <TextBox Text="TextBox"/>
        <TextBlock Text="TextBlock"/>
    </StackPanel>
</Window>
```
