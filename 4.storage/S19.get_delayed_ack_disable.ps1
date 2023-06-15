#
# Set Delayed Ack to Disable
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$vmhba=Get-VMhost $f.alias | Get-VMHostHBA -Type Iscsi | Select Device
	$Key="DelayedAck"
	$value="0"
}

foreach ($a in ($vmhba))
{
	$esxcli.iscsi.adapter.param.get.invoke(@{adapter=$a.Device})
}
Disconnect-VIServer -Server * -Force -confirm:$false
