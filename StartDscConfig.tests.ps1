
Describe "InheritedResource" { 




    Context "Compiling" {

        .\Compile.ps1

        it 'Has build mof from configuration.' {

            Get-item -Path $PSScriptRoot\Artifacts\TestingInherited\localhost.mof | should be $true
        }
    }

}




