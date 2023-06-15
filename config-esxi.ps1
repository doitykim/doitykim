function Show-Menu
{
     param (
           [string]$Title = ‘VMware ESXi Configuration Scripts ’
     )
     cls
     Write-Host "============================================="
     Write-Host "     $Title"
     Write-Host " "
     Write-Host "                Version: 1.0"
     Write-Host "            Written by Yanghwa Kim"
     Write-Host "              yhkim@iroo.co.kr"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Host <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "1: create cluster"
     Write-Host "2: delete cluster"
     Write-Host "3: add host"
     Write-Host "4: add domain name"
     Write-Host "5: add ntp server"
     Write-Host "7: setup logsize"
     Write-Host "8: setup power management"
     Write-Host "9: start ssh service"
     Write-Host "10: disable ssh warning message"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Network <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "21: add vswitch"
     Write-Host "22: change loadbalance policy"
     Write-Host "23: set jumbo frame"
     Write-Host "24: change iscsi nic order"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Storage <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "31: rename local datastore"
     Write-Host "32: enable iscsi initiator"
     Write-Host "33: add iscsi target"
     Write-Host "34: bind iscsi kernel"
     Write-Host "35: add claim rule"
     Write-Host "37: disable delayed ack"
     Write-Host "38: set iops"
     Write-Host "============================================="
     Write-Host "      >>>>>>>>>> Operation <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "41: host enter maintenance mode"
     Write-Host "42: host exit maintenance mode"
     Write-Host "43: host reboot"
     Write-Host "============================================="
     Write-Host "      >>>>>>>>>> Optional Config <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "36: set path policy"
     Write-Host "39: Set default path policy"

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
                invoke-expression -Command $PSScriptRoot/1.cluster/C01.new_cluster.ps1
           } ‘2’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C02.del_cluster.ps1
           } ‘3’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H03.add_host.ps1
           } ‘4’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H06.add_domain_name.ps1
           } ‘5’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H04.add_ntp.ps1
           } ‘6’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H12.setup_syslog.ps1
           } ‘7’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H15.setup_log_size.ps1
           } ‘8’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H17.set_powermgmt-v2.ps1
           } ‘9’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H08.start_ssh_service.ps1
           } ‘10’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H10.disable_ssh_warning_message.ps1
           } ‘21’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N01.add_vswitch_VLAN.ps1
           } ‘22’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N02.change-lb-policy.ps1
           } ‘23’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N04.set_jumbo_vmk.ps1
           } ‘24’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N06.change-iscsi-nic-order.ps1
           } ‘31’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S14.rename_local_datastore.ps1
           } ‘32’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S02.enable_sw_iscsi.ps1
           } ‘33’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S03.add_iscsi_target.ps1
           } ‘34’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S06.bind_iscsi_kernel.ps1
           } ‘35’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S13.add_claim_rule.ps1
           } ‘36’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S08.set_path_policy.ps1
           } ‘37’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S18.set_delayed_ack_disable.ps1
           } ‘38’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S17.set_iops.ps1
           } ‘39’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S10.set_default_path_policy.ps1
           } ‘41’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H80.host-enter_maintenance_mode.ps1
           } ‘42’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H81.host-exit_maintenance_mode.ps1
           } ‘43’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H82.host_rebooting.ps1
           } ‘q’ {
                return
           }
     }
     pause
}
until ($input -eq ‘q’)
