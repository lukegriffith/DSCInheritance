using Module Base


[DscResource()]
class InheritedResource : Base
{

    [DSCProperty(Key)]
    [String]$SettingName 


#    InheritedResource() {
#        $this.TimeStarted = [DateTime]::new()
#    }

    [void] Set()
    {        
    }    

    [InheritedResource]Get() {


        Write-Verbose $this.TimeStarted

        return $this

    }
    [bool] Test()
    {        
        return $true
    }    
    # Gets the resource's current state.
 

}