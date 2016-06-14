
Task -name PreDeployment -action {


    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name Base -Value $PSScriptRoot\Modules\Base
    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name InheritedResource -Value $PSScriptRoot\Modules\InheritedResource


}