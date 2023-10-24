# Iterators
[Iterators | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/csharp/iterators)

## yield return
```csharp
public IEnumerable<int> GetSingleDigitNumbersLoop()
{
    int index = 0;
    while (index < 10)
        yield return index++;
    //yield break;
}
```