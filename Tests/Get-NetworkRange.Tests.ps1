if (-not $ENV:BHProjectPath) {
    Set-BuildEnvironment -Path $PSScriptRoot\..
}
Remove-Module $ENV:BHProjectName -ErrorAction SilentlyContinue
Import-Module (Join-Path $ENV:BHProjectPath $ENV:BHProjectName) -Force


InModuleScope $ENV:BHProjectName {
    $PSVersion = $PSVersionTable.PSVersion.Major
    $ProjectRoot = $ENV:BHProjectPath

    $Verbose = @{}
    if ($ENV:BHBranchName -notlike "master" -or $env:BHCommitMessage -match "!verbose") {
        $Verbose.add("Verbose", $True)
    }

    Describe "Get-NetworkRange" {
        It "Should return IPs in given range" {
            Get-NetworkRange -IpRange 192.168.0.0-192.168.0.4 | Should -HaveCount 5
        }
        It "Should return IPs in ip/subnet mask" {
            Get-NetworkRange -IPAddress 192.168.0.0 -SubnetMask 255.255.255.252 | Should -HaveCount 2
        }
        It "Should return IPs in CIDR network" {
            Get-NetworkRange -IpAndMaskLength 192.168.0.0/30 | Should -HaveCount 2
        }
    }
}