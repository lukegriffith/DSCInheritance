# DSC Inheritance

Example of using the PowerShell v5 classes to make a DSC resource that inherits from a base. 



    [srv]: PS C:\Users\Administrator\Documents> Get-DscConfiguration
    
    
    ConfigurationName    : TestingInherited
    DependsOn            : 
    ModuleName           : InheritedResource
    ModuleVersion        : 1.0
    PsDscRunAsCredential : 
    ResourceId           : [InheritedResource]Testing
    SourceInfo           : 
    Enforce              : Always
    Ensure               : Present
    Message              : something
    SettingName          : This Setting
    PSComputerName       : 
    CimClassName         : InheritedResource
    
    