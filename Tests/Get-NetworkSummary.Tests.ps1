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

    Describe "Get-NetworkSummary" {
        Context "IPAddress/SubnetMask" {
            BeforeAll {
                $NetworkSummary = Get-NetworkSummary -IPAddress 192.168.0.1 -SubnetMask 255.255.255.0
            }

            It "Should return correct Network for IPAddress/SubnetMask" {
                $NetworkSummary.Network | Should -BeExactly '192.168.0.0'
            }
            It "Should return correct Broadcast for IPAddress/SubnetMask" {
                $NetworkSummary.Broadcast | Should -BeExactly '192.168.0.255'
            }
            It "Should return correct Range for IPAddress/SubnetMask" {
                $NetworkSummary.Range | Should -BeExactly '192.168.0.1 - 192.168.0.254'
            }
            It "Should return correct RangeStart for IPAddress/SubnetMask" {
                $NetworkSummary.RangeStart | Should -BeExactly '192.168.0.1'
            }
            It "Should return correct RangeEnd for IPAddress/SubnetMask" {
                $NetworkSummary.RangeEnd | Should -BeExactly '192.168.0.254'
            }
            It "Should return correct Mask for IPAddress/SubnetMask" {
                $NetworkSummary.Mask | Should -BeExactly '255.255.255.0'
            }
            It "Should return correct MaskLength for IPAddress/SubnetMask" {
                $NetworkSummary.MaskLength | Should -BeExactly '24'
            }
            It "Should return correct Hosts for IPAddress/SubnetMask" {
                $NetworkSummary.Hosts | Should -BeExactly '254'
            }
            It "Should return correct Class for IPAddress/SubnetMask" {
                $NetworkSummary.Class | Should -BeExactly 'C'
            }
            It "Should return correct IsPrivate for IPAddress/SubnetMask" {
                $NetworkSummary.IsPrivate | Should -BeTrue
            }
        }
        Context "IPAddress/SubnetMask" {
            BeforeAll {
                $NetworkSummary = Get-NetworkSummary -IpAndMaskLength 192.168.0.1/24
            }

            It "Should return correct Network for IPAddress/SubnetMask" {
                $NetworkSummary.Network | Should -BeExactly '192.168.0.0'
            }
            It "Should return correct Broadcast for IPAddress/SubnetMask" {
                $NetworkSummary.Broadcast | Should -BeExactly '192.168.0.255'
            }
            It "Should return correct Range for IPAddress/SubnetMask" {
                $NetworkSummary.Range | Should -BeExactly '192.168.0.1 - 192.168.0.254'
            }
            It "Should return correct RangeStart for IPAddress/SubnetMask" {
                $NetworkSummary.RangeStart | Should -BeExactly '192.168.0.1'
            }
            It "Should return correct RangeEnd for IPAddress/SubnetMask" {
                $NetworkSummary.RangeEnd | Should -BeExactly '192.168.0.254'
            }
            It "Should return correct Mask for IPAddress/SubnetMask" {
                $NetworkSummary.Mask | Should -BeExactly '255.255.255.0'
            }
            It "Should return correct MaskLength for IPAddress/SubnetMask" {
                $NetworkSummary.MaskLength | Should -BeExactly '24'
            }
            It "Should return correct Hosts for IPAddress/SubnetMask" {
                $NetworkSummary.Hosts | Should -BeExactly '254'
            }
            It "Should return correct Class for IPAddress/SubnetMask" {
                $NetworkSummary.Class | Should -BeExactly 'C'
            }
            It "Should return correct IsPrivate for IPAddress/SubnetMask" {
                $NetworkSummary.IsPrivate | Should -BeTrue
            }
        }
        Context "IP Classes" {
            It "Should be Class C Network" {
                $NetworkSummary = Get-NetworkSummary -IpAndMaskLength 192.168.0.1/24
                $NetworkSummary.Class | Should -BeExactly 'C'
            }
            It "Should be Class B Network" {
                $NetworkSummary = Get-NetworkSummary -IpAndMaskLength 172.16.0.0/12
                $NetworkSummary.Class | Should -BeExactly 'B'
            }
            It "Should be Class A Network" {
                $NetworkSummary = Get-NetworkSummary -IpAndMaskLength 10.10.10.0/24
                $NetworkSummary.Class | Should -BeExactly 'A'
            }
        }
    }
}