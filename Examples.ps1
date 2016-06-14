

configuration TestingInherited {



    Import-DscResource -ModuleName InheritedResource


    InheritedResource Testing {


        Ensure = 'Present'
        SettingName = "This Setting"
        Enforce = 'Always'


    }
}



TestingInherited