---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/ConvertTo-MaskLength.md
schema: 2.0.0
---

# ConvertTo-MaskLength

## SYNOPSIS
Returns the length of a subnet mask.

## SYNTAX

```
ConvertTo-MaskLength [-SubnetMask] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-MaskLength accepts any IPv4 address as input, however the output value
only makes sense when using a subnet mask.

## EXAMPLES

### Example 1
```powershell
PS C:\> ConvertTo-MaskLength 255.128.0.0
9
```

Converts valid subnet mask 255.128.0.0 to mask length 9.

## PARAMETERS

### -SubnetMask
A subnet mask to convert into length

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases: Mask

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
