#
# HA Enable/Disable
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.cluster
	#
	# HA Disable 
	#
	get-cluster $f.cluster | Set-cluster -HAenabled:$false -confirm:$false 
}

Disconnect-VIServer -Server * -Force -confirm:$false
