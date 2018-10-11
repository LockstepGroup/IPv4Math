Function Get-NetworkAddress {
    [CmdLetBinding(DefaultParameterSetName="ipandmask")]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True,ParameterSetName = 'ipandmask')]
        [Net.IPAddress]$IPAddress,
        
        [Parameter(Mandatory = $True, Position = 1,ParameterSetName = 'ipandmask')]
        [Alias("Mask")]
        [Net.IPAddress]$SubnetMask,
        
        [Parameter(Mandatory = $True, Position = 0,ParameterSetName = 'ipandmasklength')]
        [ValidatePattern('\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(3[0-2]|2[0-9]|1[0-9]|[0-9])\b')]
        [string]$IpAndMaskLength
    )
   
    Process {
        switch ($PsCmdlet.ParameterSetName) {
            'ipandmasklength' {
                $IPAddress = ($IpAndMaskLength.Split('/'))[0]
                $MaskLength = ($IpAndMaskLength.Split('/'))[1]
                $SubnetMask = ConvertTo-Mask $MaskLength
            }
        }
        Return ConvertTo-DottedDecimalIP ((ConvertTo-DecimalIP $IPAddress) -BAnd (ConvertTo-DecimalIP $SubnetMask))
    }
}