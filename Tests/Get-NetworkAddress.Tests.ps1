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

    Describe "Get-NetworkAddress" {
        It "Returns Network Address for IP Address and Subnet Mask" {
            Get-NetworkAddress -IPAddress 192.168.0.1 -SubnetMask 255.255.255.0 | Should -BeExactly '192.168.0.0'
        }
        It "Returns Network Address for IP Address and Mask Length" {
            Get-NetworkAddress -IpAndMaskLength 192.168.0.1/24 | Should -BeExactly '192.168.0.0'
        }
    }
}