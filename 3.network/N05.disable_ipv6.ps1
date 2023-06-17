#
# disable ipv6
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.network.system.module.parameters.set.invoke(@{module="tcpip4"; parameterstring = "ipv6=0"})
}
Disconnect-VIServer -Server * -Force -confirm:$false
