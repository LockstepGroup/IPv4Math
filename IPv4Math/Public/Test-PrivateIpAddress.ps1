function Test-PrivateIpAddress {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [IpAddress]$IpAddress
    )

    $Rfc1918Space = @(
        '10.0.0.0/8',
        '172.16.0.0/12',
        '192.168.0.0/16'
    )

    foreach ($network in $Rfc1918Space) {
        if (Test-IpInRange -ContainingNetwork $network -IPAddress $IpAddress) {
            return $true
        }
    }

    return $false
}