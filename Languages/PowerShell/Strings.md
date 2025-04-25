# Strings
[Everything you wanted to know about variable substitution in strings](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-string-substitutions)

## Quoting rules
[about\_Quoting\_Rules - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.5#here-strings)

> When parsing, PowerShell first looks to interpret input as an expression. But when a command invocation is encountered, parsing continues in argument mode. Non-numeric arguments without quotes are treated as strings. If you have arguments that contain spaces, such as paths, then you must enclose those argument values in quotes.

- How to pass string containing spaces without quotes?

  Needed for wrapping CLI commands.

  - `--%`, only works for external commands

    [How do I pass raw strings to commands through the command line in PowerShell? - Stack Overflow](https://stackoverflow.com/questions/18187020/how-do-i-pass-raw-strings-to-commands-through-the-command-line-in-powershell)

[Using Windows PowerShell to run old command line tools (and their weirdest parameters) | Microsoft Docs](https://web.archive.org/web/20220120123405/https://docs.microsoft.com/en-us/archive/blogs/josebda/using-windows-powershell-to-run-old-command-line-tools-and-their-weirdest-parameters)

## Multi-line strings
- [Here strings](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.5#here-strings): `@`
  ```pwsh
  $a=@'
  a
  b
  '@
  ```
  - Must begins with the opening mark followed by a newline
  - Must ends with a newline followed by the closing mark

    > the `"@` (or `'@`) needs to be at the very start of the final line, with nothing after it
  - All whitespaces are included, including `\r\n`

  > A here-string is a single-quoted or double-quoted string in which quotation marks are interpreted literally. A here-string can span multiple lines. All the lines in a here-string are interpreted as strings, even though they're not enclosed in quotation marks.

  [Maximizing the Power of Here-String in PowerShell for Configuration Data - Scripting Blog \[archived\]](https://devblogs.microsoft.com/scripting/maximizing-the-power-of-here-string-in-powershell-for-configuration-data/)

- `+`
  ```pwsh
  $a="a" +
  "b"
  ```

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
