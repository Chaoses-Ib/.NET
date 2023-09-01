# File
## Replacement
[File.Replace](https://learn.microsoft.com/en-us/dotnet/api/system.io.file.replace)
- If the `sourceFileName` and `destinationFileName` are on different volumes, this method will raise an exception. If the `destinationBackupFileName` is on a different volume from the source file, the backup file will be deleted.

- If the file described by the `destinationFileName` parameter could not be found, this method will raise a `FileNotFoundException`.

- [Implement File.Replace() as a documented safe atomic API - Issue #18034 - dotnet/runtime](https://github.com/dotnet/runtime/issues/18034)

[`File.Move(bool overwrite)`](https://learn.microsoft.com/en-us/dotnet/api/system.io.file.move#system-io-file-move(system-string-system-string-system-boolean))
- Requiring .NET Core 3.0+.