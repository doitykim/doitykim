#
# Set Delayed Ack to Disable
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$targets = $esxcli.iscsi.adapter.target.portal.list.invoke()  | where-object {$_.Target -like "*freenas*"}
	$iscsihba = get-vmhosthba |where-object {$_.Model -eq "iSCSI Software Adapter"}
	foreach ($target in $targets)
	{
                   $iscsiargs = $esxcli.iscsi.adapter.discovery.sendtarget.param.set.CreateArgs()
                   $iscsiargs.adapter = $iscsihba.Device
                   $iscsiargs.address = $target.IP
		   $iscsiargs.value = "false"
                   $iscsiargs.key = "DelayedAck"
                   $esxcli.iscsi.adapter.discovery.sendtarget.param.set.invoke($iscsiargs) |out-null
         }     
}	
Disconnect-VIServer -Server * -Force -confirm:$false
