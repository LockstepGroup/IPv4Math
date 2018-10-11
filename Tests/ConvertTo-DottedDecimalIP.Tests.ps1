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

    Describe "ConvertTo-DottedDecimalIP" {
        Mock Get-Item { return @{Value = "macos"} } -ParameterFilter { $Path -eq 'env:os' }
        It "Should convert a Decimal IP correctly" {
            ConvertTo-DottedDecimalIP 3232235521 | Should -BeExactly '192.168.0.1'
        }
        It "Should convert a Binary IP correctly" {
            ConvertTo-DottedDecimalIP '11000000.10101000.00000000.00000001' | Should -BeExactly '192.168.0.1'
        }
    }
}