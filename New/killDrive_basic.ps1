#Get Drive Process
$drive = Get-Process -Name "GoogleDriveFS" -ErrorAction SilentlyContinue 
if ($drive) {
    write "`n`nGoogle Drive is currently running. Shutting down Google Drive...`n`n"

    #Stop Drive
    $drive | Stop-Process

    #Wait 5 Seconds
    sleep 5

    #Check to see if its dead
    if($drive -eq $null){
        write "`n`nGoogle Drive has successfully shut down, restarting Google Drive...`n"

        #Restart Drive
        Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"

        #Wait 3 Seconds
        sleep 3

        #Check if Drive is running and display error message if it's not
        if ($drive) {
            write "`n`nGoogle Drive has successfully restarted."
        }

        else {
            write "`n`nGoogle Drive did not restart correctly. Please contact IT"
        }
    }
}

# Drive was not running to begin with
else {
    #Should I use:
    #        elseif ($drive -eq $null) instead?


    #Start Drive
    write "`n`nGoogle Drive is not running, Starting Google Drive..."
    Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"

    #Wait 5 Seconds
    sleep 5

    #check
    if($drive) {
        write "`n`nGoogle Drive has successfully started.`n"
    }
 }

 write "`n`nThe Script is Complete"
