#
# Set default path policy
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.storage.nmp.satp.set.invoke(@{satp="VMW_SATP_ALUA"; defaultpsp="VMW_PSP_RR"; boot=$true})
}
Disconnect-VIServer -Server * -Force -confirm:$false
