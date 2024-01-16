# Border
[BorderBrush | 2,000 Things You Should Know About WPF](https://wpf.2000things.com/tag/borderbrush/)

- By default, the `BorderBrush` is `null` and `BorderThickness` is a `Thickness` structure with all of its dimensions set to `0`.

- [xaml - How does Border Thickness Affect the width of the Margin, Padding, or content of the UI Control? - Stack Overflow](https://stackoverflow.com/questions/48602494/how-does-border-thickness-affect-the-width-of-the-margin-padding-or-content-of)

- Thickness overlapping

  [c# - How to prevent double thickness borders at overlap? - Stack Overflow](https://stackoverflow.com/questions/18448272/how-to-prevent-double-thickness-borders-at-overlap)

- Partial border
  - `Rectangle`
    - `CornerRadius`
      
      [How to: Round the Corners of a RectangleGeometry - WPF .NET Framework | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/graphics-multimedia/how-to-round-the-corners-of-a-rectanglegeometry?view=netframeworkdesktop-4.8)

      [WPF rectangle - round just top corners - Stack Overflow](https://stackoverflow.com/questions/1697413/wpf-rectangle-round-just-top-corners)

      [wpf - Rectangle CornerRadius - Stack Overflow](https://stackoverflow.com/questions/27274535/rectangle-cornerradius)

      [WPF PartiallyRoundedRectangle: Choose Which Corners You Want Rounded - CodeProject](https://www.codeproject.com/Articles/21449/WPF-PartiallyRoundedRectangle-Choose-Which-Corners)

  [c# - Partial border around Textbox - Stack Overflow](https://stackoverflow.com/questions/32157348/partial-border-around-textbox)

- Clipping

  ```xaml
  <Grid>
      <Grid.OpacityMask>
          <VisualBrush Visual="{Binding ElementName=Border1}" />
      </Grid.OpacityMask>
      <Border x:Name="Border1" CornerRadius="30" Background="Green" />
      <TextBlock Text="asdas das d asd a sd a sda" />
  </Grid>
  ```

  [wpf - How to make the contents of a round-cornered border be also round-cornered? - Stack Overflow](https://stackoverflow.com/questions/324641/how-to-make-the-contents-of-a-round-cornered-border-be-also-round-cornered)