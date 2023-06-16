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
     Write-Host "     >>>>>>>>>> Cluster <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "C01: create cluster"
     Write-Host "C02: delete cluster"
     Write-Host "C03: enable ha"
     Write-Host "C04: disable ha"
     Write-Host "C05: ha admission disable"
     Write-Host "C06: ignore Insufficiant HBDatastore"
     Write-Host "C07: ignore mgmt network wanring message"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Host <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "H01: add host"
     Write-Host "H02: add domain name"
     Write-Host "H03: add ntp server"
     Write-Host "H04: setup logsize"
     Write-Host "H05: setup power management"
     Write-Host "H06: start ssh service"
     Write-Host "H07: disable ssh warning message"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Network <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "N01: add vswitch"
     Write-Host "N02: change loadbalance policy"
     Write-Host "N03: set jumbo frame"
     Write-Host "N04: change iscsi nic order"
     Write-Host "============================================="
     Write-Host "     >>>>>>>>>> Config Storage <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "S01: rename local datastore"
     Write-Host "S02: enable iscsi initiator"
     Write-Host "S03: add iscsi target"
     Write-Host "S04: bind iscsi kernel"
     Write-Host "S05: add claim rule"
     Write-Host "S06: set iops"
     Write-Host "============================================="
     Write-Host "      >>>>>>>>>> Operation <<<<<<<<<<"
     Write-Host "============================================="
     Write-Host "H81: host enter maintenance mode"
     Write-Host "H82: host exit maintenance mode"
     Write-Host "H83: host reboot"
     Write-Host “Q: Quit.”
}

do
{
     Show-Menu
     $input = Read-Host “Please make a selection”
     switch ($input)
     {
	‘C01’ { 
		cls
		invoke-expression -Command $PSScriptRoot/1.cluster/C01.new_cluster.ps1 }
	‘C02’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C02.del_cluster.ps1 } 
	‘C03’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C03.enable_ha.ps1 } 
	‘C04’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C04.disable_ha.ps1 } 
	‘C05’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C05.ha_admission_dis.ps1 } 
	‘C06’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C06.ignoreInsufficianHBDatastore.ps1 } 
	‘C07’ {
                cls
                invoke-expression -Command $PSScriptRoot/1.cluster/C07.ignore_mgmt_network_warning_msg.ps1 } 
	‘H01’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H01.add_host.ps1 } 
	‘H02’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H02.add_domain_name.ps1 } 
	‘H03’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H03.add_ntp.ps1 } 
	‘H04’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H04.setup_log_size.ps1 } 
	‘H05’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H05.set_powermgmt.ps1 } 
	‘H06’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H06.start_ssh_service.ps1 } 
	‘H07’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H07.disable_ssh_warning_message.ps1 } 
	‘N01’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N01.add_vswitch_vlan.ps1 } 
	‘N02’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N02.change_lb_policy.ps1 } 
	‘N03’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N03.set_jumbo_vmk.ps1 } 
	‘N04’ {
                cls
                invoke-expression -Command $PSScriptRoot/3.network/N04.change_iscsi_nic_order.ps1 } 
	‘S01’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S01.rename_local_datastore.ps1 } 
	‘S02’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S02.enable_sw_iscsi.ps1 } 
	‘S03’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S03.add_iscsi_target.ps1 } 
	‘S04’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S04.bind_iscsi_kernel.ps1 } 
	‘S05’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S05.add_claim_rule.ps1 } 
	‘S06’ {
                cls
                invoke-expression -Command $PSScriptRoot/4.storage/S06.set_iops.ps1 } 
	‘H81’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H81.host_enter_maintenance_mode.ps1 } 
	‘H82’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H82.host_exit_maintenance_mode.ps1 } 
	‘H83’ {
                cls
                invoke-expression -Command $PSScriptRoot/2.host/H83.host_rebooting.ps1 } 
	‘q’ {
                return
            }
     }
     pause
}
until ($input -eq ‘q’)
