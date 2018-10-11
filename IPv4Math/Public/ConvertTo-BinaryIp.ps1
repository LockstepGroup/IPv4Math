Function ConvertTo-BinaryIP {   
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [Net.IPAddress]$IPAddress
    )
   
    Process {
        $ReturnObject = ""
        foreach ($byte in $IPAddress.GetAddressBytes()) {
            if ($ReturnObject.Length -gt 0) {
                $ReturnObject += '.'
            }
            $ReturnObject += [Convert]::ToString($byte, 2).PadLeft(8, '0')
        }
        $ReturnObject
    }
}