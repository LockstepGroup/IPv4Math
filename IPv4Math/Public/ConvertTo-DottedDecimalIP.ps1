Function ConvertTo-DottedDecimalIP {
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
            }
            default {
                Write-Error "Cannot convert this format"
            }
        }
        $ReturnObject
    }
}