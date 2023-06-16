#
# Unload module
#

. "$HOME/scripts/globalval.ps1"
#

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.system.module.set.Invoke(@{module=$unload_module1; force=$false; enabled=$false})
	$esxcli.system.module.set.Invoke(@{module=$unload_module2; force=$false; enabled=$false})
}

Disconnect-VIServer -Server * -Force -confirm:$false
