#
# vSphere ��� ���� ���� Scripts  
# ���� - get mtu -> get-path-policy -> get vpg nic -> get-vswitch -> vsw NIC Teaming  -> bnx2x -> get-iscsi iqn -> lun path -> vm_network
#                                      
. "$HOME/scripts/globalval.ps1"

$device = "vmhba40"
#
$outputfile = "C:\scripts.v5\00_output\get-info-all.txt"

foreach ($f in (import-csv -path $targetfile))
{
	echo "############################################" >> $outputfile 
 	echo $f.alias >> $outputfile 
	echo "############################################" >> $outputfile 
     	get-vmhost $f.alias | Get-VMHostNetworkAdapter -vmkernel | fl -property Mtu, PortGroupName, VMHost, IP, vMotionEnabled >> $outputfile
        get-VMhost $f.alias |Get-Scsilun -luntype disk | fl -property vmhost, runtimename, multipathpolicy >> $outputfile 
        get-vmhost $f.alias | Get-VirtualPortGroup -name *iscsi* | Get-NicTeamingPolicy >> $outputfile 
        get-vmhost $f.alias | Get-VMHostNetworkAdapter -vmkernel | format-table -Autosize -property Mac, PortGroupName, VMHost, IP >> $outputfile
        get-vmhost $f.alias | Get-Virtualswitch -name vSwitch1 | Get-NicTeamingPolicy | format-table -Autosize VirtualSwitch, LoadBalancingPolicy, ActiveNic  >> $outputfile
	$ESXCLI = Get-EsxCli -VMHost $f.alias
	$ESXCLI.system.module.get("bnx2x").version >> $outputfile
        get-vmhosthba $f.alias -device $device | format-table -Autosize  VMHost,IScsiName >> $outputfile
        get-scsilun -vmhost $f.alias -luntype disk |get-scsilunpath |where-object {$_.Name -match "iqn.199*"} >> $outputfile
}
Disconnect-VIServer -Server * -Force -confirm:$false
