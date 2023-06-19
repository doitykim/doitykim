#
# Set Delayed Ack to Disable
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
}

$targets = $esxcli.iscsi.adapter.target.portal.list.invoke()  | where-object {$_.Target -like "*purestorage*"}

foreach ($a in ($targets))
{
	$esxcli.iscsi.adapter.discovery.sendtarget.param.set.invoke(@{adapter=$iscsi_adapter; address=$a.IP; vaule="false"})
}
Disconnect-VIServer -Server * -Force -confirm:$false
