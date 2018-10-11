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

    Describe "ConvertTo-MaskLength" {
        It "Should covert valid mask correctly" {
            ConvertTo-MaskLength 255.255.128.0 | Should -BeExactly 17
        }
        It "Should error out on invalid masks." {
            { ConvertTo-MaskLength 255.255.0.128 } | Should -Throw
        }
    }
}