---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/Get-NetworkRange.md
schema: 2.0.0
---

# Get-NetworkRange

## SYNOPSIS
Returns an array of IPs in a given network range.

## SYNTAX

### ipandmask (Default)
```
Get-NetworkRange [-IPAddress] <IPAddress> [-SubnetMask] <IPAddress> [<CommonParameters>]
```

### ipandmasklength
```
Get-NetworkRange [-IpAndMaskLength] <String> [<CommonParameters>]
```

### iprange
```
Get-NetworkRange [-IpRange] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns an array of IPs in a given network range.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NetworkRange -IpAndMaskLength 192.168.0.0/30
192.168.0.1
192.168.0.2
```

Returns IPAddresses in provided CIDR network.

### Example 2
```powershell
PS C:\> Get-NetworkRange -IpRange 192.168.0.0-192.168.0.4
192.168.0.0
192.168.0.1
192.168.0.2
192.168.0.3
192.168.0.4

```

Returns IPAddresses in provided network range.

### Example 3
```powershell
PS C:\> Get-NetworkRange -IPAddress 192.168.0.0 -SubnetMask 255.255.255.252
192.168.0.1
192.168.0.2

```

Returns IPAddresses in provided IpAddress and SubnetMask.

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

### -IpRange
Range of IPs separated by a hyphen (192.168.0.1-192.168.0.50)

```yaml
Type: String
Parameter Sets: iprange
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
