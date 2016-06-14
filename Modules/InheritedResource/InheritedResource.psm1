using Module Base


[DscResource()]
class InheritedResource : Base
{

    [DSCProperty(Key)]
    [String]$SettingName 


    InheritedResource() {
        $this.TimeStarted = [DateTime]::new()
    }


    [InheritedResource]Get() {


        Write-Verbose $this.TimeStarted

        return $this

    }

}