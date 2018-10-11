---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/ConvertTo-DottedDecimnalIP.md
schema: 2.0.0
---

# ConvertTo-DottedDecimalIP

## SYNOPSIS
Returns a dotted decimal IP address from either an unsigned 32-bit integer or a dotted binary string.

## SYNTAX

```
ConvertTo-DottedDecimalIP [-IPAddress] <String> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-DottedDecimalIP uses a regular expression match on the input string to convert to an IP address.

## EXAMPLES

### Example 1
```powershell
PS C:\> ConvertTo-DottedDecimalIP 3232235521
192.168.0.1
```

Converts a decimal IP to Dotted Decimal IP.

### Example 2
```powershell
PS C:\> ConvertTo-DottedDecimalIP '11000000.10101000.00000000.00000001'
192.168.0.1
```

Converts a Binary IP to Dotted Decimal IP.

## PARAMETERS

### -IPAddress
A string representation of an IP address from either UInt32 or dotted binary.

```yaml
Type: String
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
