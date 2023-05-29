function Show-Menu
{
     param (
           [string]$Title = ‘VMware ESXi Configuration Scripts ’
     )
     cls
     Write-Host "============================================="
     Write-Host "$Title"
     Write-Host " "
     Write-Host "Version: 1.0"
     Write-Host "Written by Yanghwa Kim(yhkim@iroo.co.kr)"
     Write-Host "============================================="

     Write-Host ">>>>> Config Host <<<<<"
     Write-Host "1: Add Host"
     Write-Host "2: Add NTP"
     Write-Host "3: Add Domain Name"
     Write-Host "4: Start SSH Service"
     Write-Host "5: Disable SSH Warning Message"
     Write-Host "6: Setup Syslog"
     Write-Host "7: Setup Logsize"
     Write-Host "9: Setup Power Management"
     Write-Host ">>>>> Config Network <<<<<"
     Write-Host "9: Add vSwitch"
     Write-Host "9: Change LB Policy"
     Write-Host "9: Set Jumbo Frame"
     Write-Host "9: Change iSCSI Nic Order"
     Write-Host ">>>>> Config Storage <<<<<"
     Write-Host "8: Rename Local Datastore"
     Write-Host "8: Enable iSCSI Initiator"
     Write-Host "8: Add iSCSI Target"
     Write-Host "8: Bind iSCSI Kernel"
     Write-Host "8: Set Path policy"
     Write-Host "8: Set Default Path policy"
     Write-Host ">>>>> Operation <<<<<"
     Write-Host "9: Host Enter Maintenance Mode"
     Write-Host "9: Host Exit Maintenance Mode"
     Write-Host "9: Host Reboot"

     Write-Host “Q: Quit.”
}

do
{
     Show-Menu
     $input = Read-Host “Please make a selection”
     switch ($input)
     {
           ‘1’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.host/test.ps1
           } ‘2’ {
                cls
                ‘You chose option #2’
           } ‘3’ {
                cls
                ‘You chose option #3’
           } ‘q’ {
                return
           }
     }
     pause
}
until ($input -eq ‘q’)
