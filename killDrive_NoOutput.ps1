####################################################################################
#
#  Kaden Payne
#
#  http://datatekaz.com/
#
#  Kills the restarts the Google Drive For Desktop Process
#
#  Designed for use with Windows 10
#
####################################################################################

#Get Drive Process
$drive = Get-Process -Name "GoogleDriveFS" -ErrorAction SilentlyContinue 
if ($drive) {
    #Stop Drive
    $drive | Stop-Process

    #Wait 5 Seconds
    sleep 5

    #Check to see if Drive closed
    #If not, then force close
    if (!$drive.HasExited) {
        $drive | Stop-Process -Force

        #Wait 5 Seconds
        sleep 5

    }

    #Check again
    #If not running, start Drive
    else {
        #Wait 5 Seconds
        sleep 5

        #Start Drive
        Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"

        #Wait 5 Seconds
        sleep 5
    }

}
    
#Same else statement as before. The first is used if the IF statement is triggered.
elseif ($drive -eq $null) {
        #Start Drive
        Start-Process  "C:\Program Files\Google\Drive File Stream\[0-9]*.*\GoogleDriveFS.exe"

        #Wait 5 Seconds
        sleep 5
    }    

    exit
