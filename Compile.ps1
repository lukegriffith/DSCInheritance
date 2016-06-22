param($ComputerName)

configuration TestingInherited {

    param($ComputerName)


    Import-DscResource -ModuleName InheritedResource


    Node $ComputerName { 

        InheritedResource Testing {


            Ensure = 'Present'
            SettingName = "This Setting"
            Enforce = 'Always'

        }
    }
}

pushd
cd $PSScriptRoot\Artifacts
TestingInherited -ComputerName $ComputerName
popd