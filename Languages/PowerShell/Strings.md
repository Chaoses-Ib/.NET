# Strings
[Everything you wanted to know about variable substitution in strings](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-string-substitutions)

## Formatting
```pwsh
# .NET string format string
[string]::Format('Hello, {0} {1}.',$first,$last)

# PowerShell format string
'Hello, {0} {1}.' -f $first, $last
```

## [Regular expressions](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions)
- `-match`

  Use the `$Matches` hashtable automatic variable to retrieve captured text.
- `-replace`
