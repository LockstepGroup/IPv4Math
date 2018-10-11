---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/ConvertTo-DecimalIP.md
schema: 2.0.0
---

# ConvertTo-DecimalIP

## SYNOPSIS
Converts a Decimal IP address into a 32-bit unsigned integer.

## SYNTAX

```
ConvertTo-DecimalIP [-IPAddress] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-DecimalIP takes a decimal IP, uses a shift-like operation on each octet and returns a single UInt32 value.

## EXAMPLES

### Example 1
```powershell
PS C:\> ConvertTo-DecimalIP 192.168.0.1
3232235521
```

Converts 192.168.0.1 to a decimal format.

## PARAMETERS

### -IPAddress
An IP Address to convert.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/LockstepGroup/IPv4Math](https://github.com/LockstepGroup/IPv4Math)

[https://www.powershellgallery.com/packages/IPv4Math](https://www.powershellgallery.com/packages/IPv4Math)
