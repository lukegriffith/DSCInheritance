using module Base

# [DscResource()] indicates the class is a DSC resource.

class Patch : Base {


    static [Bool]ShouldPatch([String]$ComputerName) {
        
        return (MockedResponse $ComputerName)
    }


    

}

function MockedResponse {
    write-output $true
}