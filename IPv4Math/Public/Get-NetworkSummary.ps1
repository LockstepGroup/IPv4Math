Function Get-NetworkSummary {
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True, ParameterSetName = 'ipandmask')]
        [Net.IPAddress]$IPAddress,

        [Parameter(Mandatory = $True, Position = 1, ParameterSetName = 'ipandmask')]
        [Alias("Mask")]
        [Net.IPAddress]$SubnetMask,

        [Parameter(Mandatory = $True, Position = 0, ParameterSetName = 'ipandmasklength')]
        [ValidatePattern('\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(3[0-2]|2[0-9]|1[0-9]|[0-9])\b')]
        [string]$IpAndMaskLength
    )



    switch ($PsCmdlet.ParameterSetName) {
        'ipandmasklength' {
            $IPAddress = ($IpAndMaskLength.Split('/'))[0]
            $MaskLength = ($IpAndMaskLength.Split('/'))[1]
            $SubnetMask = ConvertTo-Mask -MaskLength $MaskLength
        }
    }

    $DecimalNetworkAddress = Get-NetworkAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP
    $DecimalBroadcastAddress = Get-BroadcastAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP
    $RangeStart = ConvertTo-DottedDecimalIP -IPAddress ($DecimalNetworkAddress + 1)
    $RangeEnd = ConvertTo-DottedDecimalIP -IPAddress ($DecimalBroadcastAddress - 1)
    $MaskLength = ConvertTo-MaskLength -SubnetMask $SubnetMask

    $Private = $False
    $BinaryIPAddress = ConvertTo-BinaryIP -IPAddress $IPAddress
    Switch -RegEx ($BinaryIPAddress) {
        "^1111" { $Class = "E"; $SubnetBitMap = "1111" }
        "^1110" { $Class = "D"; $SubnetBitMap = "1110" }
        "^110" {
            Write-Verbose "Class C"
            $Class = "C"
            If ($BinaryIPAddress -Match "^11000000.10101000") { $Private = $True }
        }
        "^10" {
            $Class = "B"
            If ($BinaryIPAddress -Match "^10101100.0001") { $Private = $True }
        }
        "^0" {
            $Class = "A"
            If ($BinaryIPAddress -Match "^00001010") { $Private = $True }
        }
    }

    $NetInfo = "" | Select-Object Network, Broadcast, Range, RangeStart, RangeEnd, Mask, MaskLength, Hosts, Class, IsPrivate
    $NetInfo.Network = ConvertTo-DottedDecimalIP -IPAddress $DecimalNetworkAddress
    $NetInfo.Broadcast = ConvertTo-DottedDecimalIP -IPAddress $DecimalBroadcastAddress
    $NetInfo.Range = "$RangeStart - $RangeEnd"
    $NetInfo.RangeStart = $RangeStart
    $NetInfo.RangeEnd = $RangeEnd
    $NetInfo.Mask = $SubnetMask
    $NetInfo.MaskLength = $MaskLength
    $NetInfo.Hosts = $DecimalBroadcastAddress - $DecimalNetworkAddress - 1
    $NetInfo.Class = $Class
    $NetInfo.IsPrivate = $Private

    Return $NetInfo
}