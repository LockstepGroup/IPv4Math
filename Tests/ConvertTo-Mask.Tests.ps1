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

    Describe "ConvertTo-Mask" {
        It "Should covert valid mask length correctly" {
            ConvertTo-Mask 16 | Should -BeExactly '255.255.0.0'
        }
        It "Should error out on invalid mask lengths" {
            { ConvertTo-Mask 34 } | Should -Throw
        }
    }
}