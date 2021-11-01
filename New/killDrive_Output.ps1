#Get Drive Process
$drive = Get-Process -Name "GoogleDriveFS" -ErrorAction SilentlyContinue 
if ($drive) {
    #Stop Drive
    $drive | Stop-Process

    #check if running
    write "Drive Process Check 1 : `n" $drive

    #Wait 5 Seconds
    sleep 5

    #Check to see if Drive closed
    #If not, then force close
    if (!$drive.HasExited) {
        $drive | Stop-Process -Force

        #Wait 5 Seconds
        sleep 5
        write "`n`nDrive Process info2 : " $drive `n
    }

    #Check again
    #If not running, start Drive
    else {
        #Write restart message
        write "`n`nGoogle Drive has successfully shut down, restarting Google Drive...`n"

        #Start Drive
        Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"

        #Wait 5 Seconds
        sleep 5
        
        if ($drive){
            write "`n`nGoogle Drive has successfully restarted."
        }

        else {
            write "`n`nGoogle Drive has not restarted. Please contact IT."
        }

    }

}
    
#Same else statement as before. The first is used if the IF statement is triggered.
elseif ($drive -eq $null) {
        #Start Drive
        write "`n`nGoogle Drive is not running, Starting Google Drive..."
        Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"


        #check
        if ($drive){
            write "`n`nGoogle Drive has successfully restarted."
        }

        else {
            write "`n`nGoogle Drive has not restarted. Please contact IT."
        }
    }    


# Can also be accomplished with:

 #else {
 #   #Start Drive
 #       write "`n`nGoogle Drive is not running, Starting Google Drive..."
 #      Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"
 #
 #       #check
 #       write $drive
 #}

    exit
