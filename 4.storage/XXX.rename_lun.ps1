#
# Rename Local Datastore
#

. "$HOME/scripts/globalval.ps1"
$TempFile="$HOME/scripts/0.target/target_temp_lun.csv"

foreach ($f in (import-csv -path $TempFile))
{
	get-datastore |where-object {$_.Name -eq $f.old_name} |Set-Datastore -Name  $f.new_name
}
Disconnect-VIServer -Server * -Force -confirm:$false
