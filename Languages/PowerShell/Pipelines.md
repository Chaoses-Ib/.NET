# [Pipelines](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines)
[Redirecting standard input\\output in Windows PowerShell - Stack Overflow](https://stackoverflow.com/questions/11447598/redirecting-standard-input-output-in-windows-powershell)
```pwsh
Get-Content input.txt | ./program > output.txt
```

## One-at-a-time processing
When executing a pipeline, PowerShell automatically enumerates any type that implements the `IEnumerable` interface and sends the members through the pipeline one at a time. The exception is `[hashtable]`, which requires a call to the `GetEnumerator()` method.

- [ConvertFrom-Json sends objects converted from a JSON array as an \*array\* through the pipeline. - Issue #3424 - PowerShell/PowerShell](https://github.com/PowerShell/PowerShell/issues/3424) (until PowerShell 7)
- [`Invoke-RestMethod` pipes the whole array as a single object instead of a single object for each each entry in the array, deviating from PowerShell conventions and `ConvertFrom-Json` - Issue #13778 - PowerShell/PowerShell](https://github.com/PowerShell/PowerShell/issues/13778)