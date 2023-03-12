# JSON
- [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/standard/serialization/system-text-json/overview)
- [Json.NET](https://www.newtonsoft.com/json) ([GitHub](https://github.com/JamesNK/Newtonsoft.Json))

[System.text.json VS Newtonsoft.json | by Sami C. | Medium](https://chsamii.medium.com/system-text-json-vs-newtonsoft-json-d01935068143)

## Default values
[DefaultValueHandling](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_DefaultValueHandling.htm)

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