#
# ESXi NIC Teaming ���� ��å ���� Scripts 
#

$user = "seadmin@vsphere.local"
$password = "Vmware1!"
$vcenter = "10.141.252.247"
#
$targetfile ="C:\scripts.v5\01_target\target100.csv"
$outputfile ="C:\scripts.v5\00_output\info-vsw-nicteam.txt"

# Connect to the vCenter Server
"{0} Connecting to vcenter server..."
Connect-VIServer -Server $vcenter -user $user -password $password -Protocol https

foreach ($f in (import-csv -path $targetfile ))
{
	echo "############################################" >> $outputfile 
 	echo $f.alias >> $outputfile 
	echo "############################################" >> $outputfile
 	get-vmhost $f.alias | Get-Virtualswitch -name vSwitch1 | Get-NicTeamingPolicy | format-table -Autosize VirtualSwitch, LoadBalancingPolicy, ActiveNic  >> $outputfile 
}
Disconnect-VIServer -Server * -Force -confirm:$false




