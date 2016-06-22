properties {
    $ComputerName = "srv"
    $Cred = (Get-Credential)
}


Task -name PreDeployment -action {


    # Configure junction points for modules.
    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name Base -Value $PSScriptRoot\Modules\Base
    New-Item -ItemType Junction -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules" -Name InheritedResource -Value $PSScriptRoot\Modules\InheritedResource


}


Task -name Test -action {


    Invoke-Pester -Script $PSScriptRoot\StartDscConfig.tests.ps1





}

Task -name Deploy -action {

    New-PSDrive -Name Target -PSProvider FileSystem -Root "\\$ComputerName\c$\Program Files\WindowsPowerShell\Modules" -Credential $Cred

    Get-ChildItem -Path $PSScriptRoot\Modules | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination Target:  -Verbose -Recurse -Force
    }
}


Task -name Integrate -action {


    & "$PSScriptRoot\Compile.ps1" -ComputerName $ComputerName

    $Cim = New-CimSession -ComputerName $ComputerName -Credential $Cred


    Start-DscConfiguration -Path $PSScriptRoot\Artifacts\TestingInherited\ -Wait -Force -Verbose -ea stop -CimSession $Cim



} -depends Deploy