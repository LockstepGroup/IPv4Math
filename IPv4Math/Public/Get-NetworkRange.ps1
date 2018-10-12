Function Get-NetworkRange {
    [CmdLetBinding(DefaultParameterSetName = "ipandmask")]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True, ParameterSetName = 'ipandmask')]
        [Net.IPAddress]$IPAddress,

        [Parameter(Mandatory = $True, Position = 1, ParameterSetName = 'ipandmask')]
        [Alias("Mask")]
        [Net.IPAddress]$SubnetMask,

        [Parameter(Mandatory = $True, Position = 0, ParameterSetName = 'ipandmasklength')]
        [ValidatePattern('\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(3[0-2]|2[0-9]|1[0-9]|[0-9])\b')]
        [string]$IpAndMaskLength,

        [Parameter(Mandatory = $false, ParameterSetName = 'ipandmask')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ipandmasklength')]
        [switch]$IncludeNetworkAndBroadcastIp,

        [Parameter(Mandatory = $True, Position = 0, ParameterSetName = 'iprange')]
        [string]$IpRange
    )

    Process {
        switch ($PsCmdlet.ParameterSetName) {
            'ipandmasklength' {
                $IPAddress = ($IpAndMaskLength.Split('/'))[0]
                $MaskLength = ($IpAndMaskLength.Split('/'))[1]
                $SubnetMask = ConvertTo-Mask $MaskLength
                $StartIp = (Get-NetworkAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP)
                $StopIp = (Get-BroadcastAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP)
                if (!($IncludeNetworkAndBroadcastIp)) {
                    $StartIp++
                    $StopIp--
                }
                break
            }
            'ipandmask' {
                $StartIp = (Get-NetworkAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP)
                $StopIp = (Get-BroadcastAddress -IPAddress $IPAddress -SubnetMask $SubnetMask | ConvertTo-DecimalIP)
                if (!($IncludeNetworkAndBroadcastIp)) {
                    $StartIp++
                    $StopIp--
                }
                break
            }
            'iprange' {
                $StartIp = $IpRange.Split('-')[0] | ConvertTo-DecimalIP
                $StopIp = $IpRange.Split('-')[1] | ConvertTo-DecimalIP
                break
            }
        }

        $ReturnObject = @()
        for ($address = $StartIp; $address -le $StopIp; $address++) {
            $ReturnObject += $address | ConvertTo-DottedDecimalIP
        }
        $ReturnObject
    }
}