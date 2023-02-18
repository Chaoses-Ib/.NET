# Flow Control
## While
```powershell
> $date = Get-Date -Date 'November 22'
> while ($date.DayOfWeek -ne 'Thursday') {
>>     $date = $date.AddDays(1)
>> }
> Write-Output $date
```

## Do
```powershell
> $number = Get-Random -Minimum 1 -Maximum 10
> do {
>>     $guess = Read-Host -Prompt "What's your guess?"
>>     if ($guess -lt $number) {
>>         Write-Output 'Too low!'
>>     }
>>     elseif ($guess -gt $number) {
>>         Write-Output 'Too high!'
>>     }
>> }
>> while ($guess -ne $number)
```

```powershell
> $number = Get-Random -Minimum 1 -Maximum 10
> do {
>>     $guess = Read-Host -Prompt "What's your guess?"
>>     if ($guess -lt $number) {
>>         Write-Output 'Too low!'
>>     }
>>     elseif ($guess -gt $number) {
>>         Write-Output 'Too high!'
>>     }
>> }
>> until ($guess -eq $number)
```

## For
```powershell
> for ($i = 1; $i -lt 5; $i++) {
>>     Write-Output "Sleeping for $i seconds"
>>     Start-Sleep -Seconds $i
>> }
```

## ForEach-Object
```powershell
> 'ActiveDirectory', 'SQLServer' |
>> ForEach-Object {Get-Command -Module $_} |  # or $PSItem
>> Group-Object -Property ModuleName -NoElement |
>> Sort-Object -Property Count -Descending
```

```powershell
> $ComputerName = 'DC01', 'WEB01'
> foreach ($Computer in $ComputerName) {
>>     Get-ADComputer -Identity $Computer
>> }
```