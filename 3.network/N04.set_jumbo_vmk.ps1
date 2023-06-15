#
# set jubmo frame for iscsi vmk
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.network.ip.interface.set.invoke(@{interfacename="vmk2"; enabled=$true; mtu="9000"}))
	$esxcli.network.ip.interface.set.invoke(@{interfacename="vmk3"; enabled=$true; mtu="9000"}))
	$esxcli.network.vswitch.standard.set.invoke(@{cdpstatus="listen"; mtu="9000", vswitchname="vSwitch1"})
}
Disconnect-VIServer -Server * -Force -confirm:$false
