---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/ConvertTo-BinaryIp.md
schema: 2.0.0
---

# ConvertTo-BinaryIP

## SYNOPSIS
Converts a Decimal IP address into a binary format.

## SYNTAX

```
ConvertTo-BinaryIP [-IPAddress] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-BinaryIP uses System.Convert to switch between decimal and binary format.
The output from this function is dotted binary string.

## EXAMPLES

### Example 1
```powershell
PS C:\> ConvertTo-BinaryIP 192.168.0.1
11000000.10101000.00000000.00000001
```

Converts 192.168.0.1 to a dotted binary format.

## PARAMETERS

### -IPAddress
An IP Address to convert.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/LockstepGroup/IPv4Math](https://github.com/LockstepGroup/IPv4Math)

[https://www.powershellgallery.com/packages/IPv4Math](https://www.powershellgallery.com/packages/IPv4Math)
