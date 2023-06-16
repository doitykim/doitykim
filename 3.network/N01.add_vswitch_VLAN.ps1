#
# add_vswitch
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	#vmotion port group
	New-VMHostNetworkAdapter -VMHost $f.alias -VirtualSwitch vSwitch0 -PortGroup $vmotion_pg  -IP $f.vmotion -SubnetMask 255.255.254.0 -VMotionEnabled $true
#	Get-VirtualPortGroup -Name $vmotion_pg -VMHost $f.alias|set-virtualportgroup -VlanID $mgmt_pg_vlan
	# 
	New-VirtualSwitch -VMHost $f.alias -Name vSwitch1 -Nic vmnic4,vmnic5 -Mtu 9000
	Get-VMhost $f.alias|Get-VirtualSwitch -Name vSwitch1|New-VirtualPortGroup -Name $service_pg -VlanID $service_pg_vlan
	New-VMHostNetworkAdapter -VMHost $f.alias -VirtualSwitch vSwitch1 -PortGroup $iscsi1_pg -IP $f.iscsi1 -SubnetMask 255.255.255.0
	New-VMHostNetworkAdapter -VMHost $f.alias -VirtualSwitch vSwitch1 -PortGroup $iscsi2_pg -IP $f.iscsi2 -SubnetMask 255.255.255.0
	Get-VirtualPortGroup -Name $iscsi1_pg -VMHost $f.alias|set-virtualportgroup -VlanID $iscsi1_pg_vlan
	Get-VirtualPortGroup -Name $iscsi2_pg -VMHost $f.alias|set-virtualportgroup -VlanID $iscsi2_pg_vlan

	#
	# remove "vm network" portgroup
	Get-vmhost $f.alias | get-virtualportgroup -name "vm network" | remove-virtualportgroup -Confirm:$false
	# change management network porgroup name
	get-vmhost $f.alias | get-virtualportgroup -name "management network" | set-virtualportgroup -name $mgmt_pg
}
Disconnect-VIServer -Server * -Force -confirm:$false
