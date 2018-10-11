Function Test-IpInRange {
    [CmdLetBinding()]
    Param(
        [Parameter(ParameterSetName = "RangeIp", Mandatory = $True, Position = 0)]
        [Parameter(ParameterSetName = "RangeContained", Mandatory = $True, Position = 0)]
        [String]$IpRange,

        [Parameter(ParameterSetName = "ContainingIp", Mandatory = $True, Position = 0)]
        [Parameter(ParameterSetName = "ContainingContained", Mandatory = $True, Position = 0)]
        [String]$ContainingNetwork,

        [Parameter(ParameterSetName = "RangeIp", Mandatory = $True, Position = 1)]
        [Parameter(ParameterSetName = "ContainingIp", Mandatory = $True, Position = 1)]
        [Net.IPAddress]$IPAddress,

        [Parameter(ParameterSetName = "RangeContained", Mandatory = $True, Position = 1)]
        [Parameter(ParameterSetName = "ContainingContained", Mandatory = $True, Position = 1)]
        [String]$ContainedNetwork
    )

    if ($IpRange) {
        $RangeStart = ConvertTo-DecimalIP $IpRange.Split("-")[0]
        $RangeStop = ConvertTo-DecimalIP $IpRange.Split("-")[1]
    } elseif ($ContainingNetwork) {
        $Summary = Get-NetworkSummary $ContainingNetwork
        $RangeStart = ConvertTo-DecimalIP $Summary.Network
        $RangeStop = ConvertTo-DecimalIP $Summary.Broadcast
    }

    if ($IPAddress) {
        $SubRangeStop = ConvertTo-DecimalIP $IPAddress
        $SubRangeStart = $SubRangeStop
    } elseif ($ContainedNetwork) {
        $SubSummary = Get-NetworkSummary $ContainedNetwork
        $SubRangeStart = ConvertTo-DecimalIP $SubSummary.Network
        $SubRangeStop = ConvertTo-DecimalIP $SubSummary.Broadcast
    }

    Write-Debug "Containing Start: $RangeStart"
    Write-Debug " Containing Stop: $RangeStop"
    Write-Debug " Contained Start: $SubRangeStart"
    Write-Debug "  Contained Stop: $SubRangeStop"

    if (($SubRangeStart -ge $RangeStart) -and ($SubRangeStop -le $RangeStop)) {
        return $true
    } else {
        return $False
    }
}
