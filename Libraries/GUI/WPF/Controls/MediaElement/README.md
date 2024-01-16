# MediaElement
[MediaPlayer Class (System.Windows.Media) | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.mediaplayer?view=windowsdesktop-8.0)
- [MediaElement Class (System.Windows.Controls) | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.mediaelement?view=windowsdesktop-8.0)

[Playing video - The complete WPF tutorial](https://wpf-tutorial.com/audio-video/playing-video/)

[FFME: The Advanced WPF MediaElement (based on FFmpeg)](https://github.com/unosquare/ffmediaelement)

## Source
- `Build Action` must be `None` and `Copy to Output Directory` should be `Copy if newer`. `Resource` doesn't work.
- `Resources/vid.mp4` works, but `/Resources/vid.mp4` doesn't. (And VS will suggest the latter.)

[.net - MediaElement not displaying - Stack Overflow](https://stackoverflow.com/questions/5007911/mediaelement-not-displaying)

## Control
- `LoadedBehavior`
  - 默认为 `Play`，即在显示时开始播放，播放一次后停止。
  - `LoadedBehavior` must be set to `Manual` in order to interactively control media with the `Play`, `Pause`, and `Stop` methods.
- [video - WPF Play Movie on Mouse Over - Stack Overflow](https://stackoverflow.com/questions/459171/wpf-play-movie-on-mouse-over)
- [c# - How to check if MediaElement has stopped? - Stack Overflow](https://stackoverflow.com/questions/25330295/how-to-check-if-mediaelement-has-stopped)
  - `MediaEnded`

## APNG
- [APNG Player Library: WPF user control designed to display and play APNG/PNG animation.](https://github.com/ImoutoChan/ApngWpfPlayer)
- [APNGManagement: APNG library in .NET, with model, assembling and viewing](https://github.com/murrple-1/APNGManagement)
- [APNG.NET: A fully-managed APNG parser, written in C#](https://github.com/xupefei/APNG.NET) (discontinued)

[WPF显示apng等格式动态图片格式展示\_apng格式动图怎么打开 - CSDN博客](https://blog.csdn.net/barry_hui/article/details/128791905)

[c# - How can I use animated PNG in UWP? - Stack Overflow](https://stackoverflow.com/questions/65053316/how-can-i-use-animated-png-in-uwp)

[How to show an animated PNG in form? : csharp](https://www.reddit.com/r/csharp/comments/1221c9n/how_to_show_an_animated_png_in_form/)