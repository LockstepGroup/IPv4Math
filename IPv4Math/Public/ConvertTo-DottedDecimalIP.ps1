Function ConvertTo-DottedDecimalIP {
    <#
      .Synopsis
        Returns a dotted decimal IP address from either an unsigned 32-bit integer or a dotted binary string.
      .Description
        ConvertTo-DottedDecimalIP uses a regular expression match on the input string to convert to an IP address.
      .Parameter IPAddress
        A string representation of an IP address from either UInt32 or dotted binary.
    #>
   
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [String]$IPAddress
    )
     
    Process {
        Switch -RegEx ($IPAddress) {
            "([01]{8}\.){3}[01]{8}" {
                $ReturnObject = ""
                foreach ($byte in $IPAddress.Split('.')) {
                    if ($ReturnObject.Length -gt 0) {
                        $ReturnObject += '.'
                    }
                    $ReturnObject += [Convert]::ToUInt32($byte, 2)

                }
                #Return [String]::Join('.', $( $IPAddress.Split('.') | ForEach-Object { [Convert]::ToUInt32($_, 2) } ))
                break
            }
            "\d+" {
                $IPAddress = [UInt32]$IPAddress
                $ReturnObject = ""
                For ($i = 3; $i -gt -1; $i--) {
                    if ($ReturnObject.Length -gt 0) {
                        $ReturnObject += '.'
                    }
                    $Remainder = $IPAddress % [Math]::Pow(256, $i)
                    $ReturnObject += ($IPAddress - $Remainder) / [Math]::Pow(256, $i)
                    $IPAddress = $Remainder
                }
            <# $DottedIP = $( For ($i = 3; $i -gt -1; $i--) {
            $Remainder = $IPAddress % [Math]::Pow(256, $i)
            ($IPAddress - $Remainder) / [Math]::Pow(256, $i)
            $IPAddress = $Remainder #>
            
          
          #Return [String]::Join('.', $DottedIP)
            }
            default {
                Write-Error "Cannot convert this format"
            }
        }
        $ReturnObject
    }
}