# Layouts
[Introduction to WPF panels - The complete WPF tutorial](https://wpf-tutorial.com/panels/introduction-to-wpf-panels/)

## Overflow
How to implement `overflow: visible` ?
- [`ClipToBounds`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.uielement.cliptobounds)
  
  [c# - Why ClipToBounds = false not work? - Stack Overflow](https://stackoverflow.com/questions/30964863/why-cliptobounds-false-not-work)

  > Basically, you are trying to go against one of the hard-coded rules of WPF, so you are likely not going to find an easy way to do it. Perhaps you might want to reevaluate your design and determine if this behavior is really necessary for what you want to do, or if you can go about it in a different way.

- `Canvas`

  ```xaml
  <Canvas Grid.Row="5" Grid.Column="3">
      <TextBlock Text="Long text here" ClipToBounds="False">
  </Canvas>
  ```

  > Note that canvas will only break the bounds of its parent container. If their are more ancestor elements up the tree, the canvas will still be bound to them.

  > If an element is put within a `Canvas` panel, elements within do not participate in layout at all you will end up breaking your layout.

  [xaml - Allow WPF Grid cell content to expand outside of the grid cell? - Stack Overflow](https://stackoverflow.com/questions/6338315/allow-wpf-grid-cell-content-to-expand-outside-of-the-grid-cell)