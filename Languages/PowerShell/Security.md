# Security
## Execution policies
[about Execution Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Or:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
which requires administrator privileges (the default scope is `LocalMachine`).