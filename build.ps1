
Task -name PreDeployment -action {


    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name Base -Value $PSScriptRoot\Modules\Base
    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name InheritedResource -Value $PSScriptRoot\Modules\InheritedResource


}


Task -name Test -action {


    Invoke-Pester -Script $PSScriptRoot\StartDscConfig.tests.ps1


    Start-DscConfiguration -Path $PSScriptRoot\TestingInherited\ -Wait -Force -Verbose -ea Stop



}