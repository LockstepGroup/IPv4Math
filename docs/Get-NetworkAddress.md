---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/Get-NetworkAddress.md
schema: 2.0.0
---

# Get-NetworkAddress

## SYNOPSIS
Takes an IP address and subnet mask then calculates the network address for the range.

## SYNTAX

```
Get-NetworkAddress [-IPAddress] <IPAddress> [-SubnetMask] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
Get-NetworkAddress returns the network address for a subnet by performing a bitwise AND
operation against the decimal forms of the IP address and subnet mask.
Get-NetworkAddress
expects both the IP address and subnet mask in dotted decimal format.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NetworkAddress -IPAddress 192.168.0.1 -SubnetMask 255.255.255.0
192.168.0.0
```

Returns the Network Address for a given IP Address and Subnet Mask.

### Example 2
```powershell
PS C:\> Get-NetworkAddress -IpAndMaskLength 192.168.0.1/24
192.168.0.0
```

Returns the Network Address for a given IP Address and Subnet Mask.

## PARAMETERS

### -IPAddress
Any IP address within the network range.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SubnetMask
The subnet mask for the network.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases: Mask

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/LockstepGroup/IPv4Math](https://github.com/LockstepGroup/IPv4Math)

[https://www.powershellgallery.com/packages/IPv4Math](https://www.powershellgallery.com/packages/IPv4Math)
