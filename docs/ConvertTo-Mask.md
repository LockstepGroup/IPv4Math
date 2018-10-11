---
external help file: IPv4Math-help.xml
Module Name: IPv4Math
online version: https://github.com/LockstepGroup/IPv4Math/blob/master/docs/ConvertTo-Mask.md
schema: 2.0.0
---

# ConvertTo-Mask

## SYNOPSIS
Returns a dotted decimal subnet mask from a mask length.

## SYNTAX

```
ConvertTo-Mask [-MaskLength] <Object> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-Mask returns a subnet mask in dotted decimal format from an integer value ranging between 0 and 32. ConvertTo-Mask first creates a binary string from the length, converts that to an unsigned 32-bit integer then calls ConvertTo-DottedDecimalIP to complete the operation.

## EXAMPLES

### Example 1
```powershell
PS C:\> ConvertTo-MaskLength 255.128.0.0
9
```

Converts valid Subnet Mask 255.128.0.0 to mask length 9.

## PARAMETERS

### -MaskLength
The number of bits which must be masked.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Length

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
