
enum Ensure
{
    Absent
        
    Present
}

enum Enforce 
{

    Always
    Controlled
    Never
}

class Base
{

    # A DSC resource must define at least one key property.
    [DscProperty(Mandatory)]
    [Enforce] $Enforce

    # Mandatory indicates the property is required and DSC will guarantee it is set.
    [DscProperty(Mandatory)]
    [Ensure] $Ensure

    # NotConfigurable properties return additional information about the state of the resource.
    # For example, a Get() method might return the date a resource was last modified.
    # NOTE: These properties are only used by the Get() method and cannot be set in configuration.        
    [DscProperty(NotConfigurable)]
    [String]$Message

    [void]WriteMessage([string]$msg) {

        $this.Message = $this.Message + " \ " + $msg
        
    } 

    hidden [DateTime]$TimeStarted


    <#
    .Notes 
    Implement functions to write DSC event log, this could lead to computers being scanned at the end of a run and stored locally. 
        [void]WriteEventLog() {

            
        }


    This sends a log message. Sent to verbose stream for inspection, Send to third party logging tools 
    Potentially provide overload for eventlog redirection also - Warn might be add evnet log.  
        [void]WriteLog() {



        }



    #>

    
    # Sets the desired state of the resource.
    [void] Set()
    {        
    }        
    
    # Tests if the resource is in the desired state.
    [bool] Test()
    {        
        return $true
    }    
    # Gets the resource's current state.
    [Base] Get()
    {        
        # NotConfigurable properties are set in the Get method.
        $this.Message = "something"
        # Return this instance or construct a new instance.
        return $this 
    }    
}