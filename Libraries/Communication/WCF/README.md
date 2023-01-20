# [Windows Communication Foundation](https://learn.microsoft.com/en-us/dotnet/framework/wcf/whats-wcf)

> Each operation has a return value and a parameter, even if these are `void`. However, unlike a local method, in which you can pass references to objects from one object to another, service operations do not pass references to objects. Instead, they pass copies of the objects.
> 
> This is significant because each type used in a parameter or return value must be serializable; that is, it must be possible to convert an object of that type into a stream of bytes and from a stream of bytes into an object.[^serializable]

[^serializable]: [Designing Service Contracts - WCF | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/wcf/designing-service-contracts)