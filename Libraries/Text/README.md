# Text
## String
- `Normalize()` may throw `InvalidOperationException` and `OutOfMemoryException` in addition to the documented `ArgumentException` in some rare cases on .NET Framework.
  
  The native part `nativeNormalizationNormalizeString()` is not open source.