# I/O
## Stream
[Stream Class (System.IO) | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.io.stream)

### Disposing
[c# - Can you keep a StreamReader from disposing the underlying stream? - Stack Overflow](https://stackoverflow.com/questions/1862261/can-you-keep-a-streamreader-from-disposing-the-underlying-stream)

- Disposing a stream twice will cause exception.
  
  ```csharp
  using (var writer = new StreamWriter(pipe))
  using (var reader = new StreamReader(pipe))
  {
      ...
  }
  ```