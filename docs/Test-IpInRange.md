---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/Test-IpInRange.md
schema: 2.0.0
---

# Test-IpInRange

## SYNOPSIS
Tests to determine if a given IPAddress or Network is contained by another Network or Ip Range.

## SYNTAX

### RangeContained
```
Test-IpInRange [-IpRange] <String> [-ContainedNetwork] <String> [<CommonParameters>]
```

### RangeIp
```
Test-IpInRange [-IpRange] <String> [-IPAddress] <IPAddress> [<CommonParameters>]
```

### ContainingContained
```
Test-IpInRange [-ContainingNetwork] <String> [-ContainedNetwork] <String> [<CommonParameters>]
```

### ContainingIp
```
Test-IpInRange [-ContainingNetwork] <String> [-IPAddress] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
Tests to determine if a given IPAddress or Network is contained by another Network or Ip Range. Returns $true or $false

## EXAMPLES

### Example 1
```powershell
PS C:\>  Test-IpInRange -IpRange 192.168.0.0-192.168.0.50 -ContainedNetwork 192.168.0.0/30
True
```

Tests to see if 192.168.0.0/30 is contained by 192.168.0.0-192.168.0.50

### Example 2
```powershell
PS C:\>  Test-IpInRange -IpRange 192.168.0.0-192.168.0.50 -IPAddress 192.168.0.2
True
```

Tests to see if 192.168.0.2 is contained by 192.168.0.0-192.168.0.50

### Example 3
```powershell
PS C:\>  Test-IpInRange -ContainingNetwork 192.168.0.0/24 -ContainedNetwork 192.168.0.4/30
True
```

Tests to see if 192.168.0.4/30 is contained by 192.168.0.0/24

### Example 4
```powershell
PS C:\>  Test-IpInRange -ContainingNetwork 192.168.0.0/24 -IPAddress 192.168.0.50
True
```

Tests to see if 192.168.0.5 is contained by 192.168.0.0/24

## PARAMETERS

### -ContainedNetwork
CIDR network and mask length

```yaml
Type: String
Parameter Sets: RangeContained, ContainingContained
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContainingNetwork
CIDR network and mask length

```yaml
Type: String
Parameter Sets: ContainingContained, ContainingIp
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPAddress
IPAddress in Dotted Decimal format

```yaml
Type: IPAddress
Parameter Sets: RangeIp, ContainingIp
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IpRange
Range of IPs separated by a hyphen (192.168.0.1-192.168.0.50)

```yaml
Type: String
Parameter Sets: RangeContained, RangeIp
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://github.com/LockstepGroup/IPv4Math](https://github.com/LockstepGroup/IPv4Math)

[https://www.powershellgallery.com/packages/IPv4Math](https://www.powershellgallery.com/packages/IPv4Math)
