# Types
## Default values
[Default values of C# types - C# reference - C# | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/default-values)

For classes, to create a default value with the default constrcutor, one can use [`Activator.CreateInstance()`](https://learn.microsoft.com/en-us/dotnet/api/system.activator.createinstance?view=net-7.0).

- [DefaultValueAttribute](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.defaultvalueattribute)

  ```csharp
  PropertyInfo[] props = obj.GetType().GetProperties();
  foreach (PropertyInfo prop in props)
  {
      var d = prop.GetCustomAttribute<DefaultValueAttribute>();
      if (d != null)
          prop.SetValue(obj, d.Value);
  }
  ```

  [c# - .NET DefaultValue attribute - Stack Overflow](https://stackoverflow.com/questions/2329868/net-defaultvalue-attribute)

[constructor - What is the best way to give a C# auto-property an initial value? - Stack Overflow](https://stackoverflow.com/questions/40730/what-is-the-best-way-to-give-a-c-sharp-auto-property-an-initial-value)