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

    Describe "ConvertTo-BinaryIP" {
        Mock Get-Item { return @{Value = "macos"} } -ParameterFilter { $Path -eq 'env:os' }
        It "Should convert correctly" {
            ConvertTo-BinaryIP 192.168.0.1 | Should -BeExactly '11000000.10101000.00000000.00000001'
        }
    }
}