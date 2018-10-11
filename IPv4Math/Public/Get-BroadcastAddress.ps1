Function Get-BroadcastAddress {
    <#
    .Synopsis
      Takes an IP address and subnet mask then calculates the broadcast address for the range.
    .Description
      Get-BroadcastAddress returns the broadcast address for a subnet by performing a bitwise AND
      operation against the decimal forms of the IP address and inverted subnet mask.
      Get-BroadcastAddress expects both the IP address and subnet mask in dotted decimal format.
    .Parameter IPAddress
      Any IP address within the network range.
    .Parameter SubnetMask
      The subnet mask for the network.
  #>

    [CmdLetBinding(DefaultParameterSetName = "ipandmask")]
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

    Process {
        switch ($PsCmdlet.ParameterSetName) {
            'ipandmasklength' {
                $IPAddress = ($IpAndMaskLength.Split('/'))[0]
                $MaskLength = ($IpAndMaskLength.Split('/'))[1]
                $SubnetMask = ConvertTo-Mask $MaskLength
            }
        }
        Return ConvertTo-DottedDecimalIP $((ConvertTo-DecimalIP $IPAddress) -BOr ((-BNot (ConvertTo-DecimalIP $SubnetMask)) -BAnd [UInt32]::MaxValue))
    }
}