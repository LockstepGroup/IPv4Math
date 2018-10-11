---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/Get-NetworkSummary.md
schema: 2.0.0
---

# Get-NetworkSummary

## SYNOPSIS
Returns a network summary of the provided IPAddress and Subnet Mask.

## SYNTAX

### ipandmask
```
Get-NetworkSummary [-IPAddress] <IPAddress> [-SubnetMask] <IPAddress> [<CommonParameters>]
```

### ipandmasklength
```
Get-NetworkSummary [-IpAndMaskLength] <String> [<CommonParameters>]
```

## DESCRIPTION
Provides details for the provided network, including:
Network
Broadcast
Range
RangeStart
RangeEnd
Mask
MaskLength
Hosts
Class
IsPrivate

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NetworkSummary -IPAddress 192.168.0.1 -SubnetMask 255.255.255.0
Network    : 192.168.0.0
Broadcast  : 192.168.0.255
Range      : 192.168.0.1 - 192.168.0.254
RangeStart : 192.168.0.1
RangeEnd   : 192.168.0.254
Mask       : 255.255.255.0
MaskLength : 24
Hosts      : 254
Class      : C
IsPrivate  : True
```

Returns the Network Summary for a given IP Address and Subnet Mask.

### Example 2
```powershell
PS C:\> Get-NetworkSummary -IpAndMaskLength 192.168.0.1/24
Network    : 192.168.0.0
Broadcast  : 192.168.0.255
Range      : 192.168.0.1 - 192.168.0.254
RangeStart : 192.168.0.1
RangeEnd   : 192.168.0.254
Mask       : 255.255.255.0
MaskLength : 24
Hosts      : 254
Class      : C
IsPrivate  : True
```

Returns the Network Summary for a given IP Address and Subnet Mask.

## PARAMETERS

### -IPAddress
IP Address in Dotted Decimal Format

```yaml
Type: IPAddress
Parameter Sets: ipandmask
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IpAndMaskLength
CIDR formatted IP Address and Mask Length

```yaml
Type: String
Parameter Sets: ipandmasklength
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubnetMask
The subnet mask for the network

```yaml
Type: IPAddress
Parameter Sets: ipandmask
Aliases: Mask

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Net.IPAddress
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://github.com/LockstepGroup/IPv4Math](https://github.com/LockstepGroup/IPv4Math)

[https://www.powershellgallery.com/packages/IPv4Math](https://www.powershellgallery.com/packages/IPv4Math)
