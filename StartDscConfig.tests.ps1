
Describe "InheritedResource" { 




    Context "Compiling" {

        .\Compile.ps1

        it 'Has build mof from configuration.' {

            Get-item -Path $PSScriptRoot\Testinginherited\localhost.mof | should be $true
        }
    }

}




