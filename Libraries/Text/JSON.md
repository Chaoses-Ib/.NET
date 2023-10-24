# JSON
- [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/standard/serialization/system-text-json/overview)
- [Json.NET](https://www.newtonsoft.com/json) ([GitHub](https://github.com/JamesNK/Newtonsoft.Json))

[System.text.json VS Newtonsoft.json | by Sami C. | Medium](https://chsamii.medium.com/system-text-json-vs-newtonsoft-json-d01935068143)

## Default values
[DefaultValueHandling](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_DefaultValueHandling.htm)

- The default `DefaultValueHandling` is `Include`.
- If `Include` is used, the default value will be serialized, and there will be no way to tell if the value is a "default value" or a "changed value". If one wish to be able to change the default value latter, `IgnoreAndPopulate`/`Ignore` should be used instead.

```csharp
// System.ArgumentNullException: Value cannot be null.
JsonConvert.DeserializeObject(null)
```

```csharp
JsonConvert.DeserializeObject(String.Empty) == null
// JsonConvert.DeserializeObject(String.Empty) ?? new Class()
```

```csharp
class Class {
	public int IntProp { get; set; } = 123;
}

JsonConvert.DeserializeObject<Class>("{}").IntProp == 123
```

```csharp
using System.ComponentModel;

class Class {
	[DefaultValue(123)]
    [JsonProperty(DefaultValueHandling = DefaultValueHandling.Populate)]
	public int IntProp { get; set; }
}

JsonConvert.DeserializeObject<Class>("{}").IntProp == 123
// JsonConvert.DeserializeObject<Class>(
//     "{}",
//     new JsonSerializerSettings { DefaultValueHandling = DefaultValueHandling.Populate }
// )
```

If the property initializer and `DefaultValueHandling.Populate` both exist, `DefaultValue` will eventually take in effect after deserialization.
- `DefaultValue` can be used as a way for specifying the default value used only by serialization, e.g. for compatibility reasons.