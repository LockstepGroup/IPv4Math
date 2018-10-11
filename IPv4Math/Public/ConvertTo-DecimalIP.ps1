Function ConvertTo-DecimalIP {
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [Net.IPAddress]$IPAddress
    )
   
    Process {
        $i = 3; $DecimalIP = 0;
        $IPAddressSplit = $IPAddress.ToString() -split "\."

        foreach ($byte in $IPAddressSplit) {
            $DecimalIP += [int]$byte * [Math]::Pow(256, $i)
            $i--
        }
    
        Return [UInt32]$DecimalIP
    }
}