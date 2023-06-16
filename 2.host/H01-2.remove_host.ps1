#
# add host 
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	#
	#  add host with domain name
	#
#	Add-VMHost $f.alias -Location $f.cluster -User root -Password vmware1!! -force:$true -confirm:$false
	#
	# add host with ip address
	#
	#Add-VMHost $f.ip -Location $f.cluster -User root -Password VMware1! -force:$true -confirm:$false
	Get-VMhost $f.ip -Location $f.cluster |Remove-Host -Confirm:$false
}
Disconnect-VIServer -Server * -Force -confirm:$false
