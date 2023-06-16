#
# esxcli software profile update 
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -v2
	$arguments = $esxcli.software.profile.update.CreateArgs()
	$arguments.depot = $f.path+$f.FileName
	$arguments.profile ="ESXi-7.0U3m-21686933-standard"
	$esxcli.software.profile.update.Invoke($arguments)
}

Disconnect-VIServer -Server * -Force -confirm:$false
