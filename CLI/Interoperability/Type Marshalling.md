# Type Marshalling
## Strings
[Charsets and marshalling](https://learn.microsoft.com/en-us/dotnet/standard/native-interop/charset)
- [Add UTF8 to CharSet · Issue #17000 · dotnet/runtime](https://github.com/dotnet/runtime/issues/17000)
  - `MarshalAs(UnmanagedType.LPUTF8Str)`
  - `[LibraryImport(StringMarshalling = StringMarshalling.Utf8)]` (.NET 7)
