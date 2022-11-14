# Binary Serialization
- [protobuf-net](https://github.com/protobuf-net/protobuf-net)
- [MessagePack](https://msgpack.org/)

## BinaryReader and BinaryWriter
- [BinaryReader](https://learn.microsoft.com/en-us/dotnet/api/system.io.binaryreader)
- [BinaryWriter](https://learn.microsoft.com/en-us/dotnet/api/system.io.binarywriter)

The default character encoding for text is UTF-8.

## BinaryFormatter
[Deserialization risks in use of BinaryFormatter and related types | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/serialization/binaryformatter-security-guide)

> The `BinaryFormatter` type is dangerous and is not recommended for data processing. Applications should stop using `BinaryFormatter` as soon as possible, even if they believe the data they're processing to be trustworthy. `BinaryFormatter` is insecure and can't be made secure.