#
# Copy Local Client File to DataStore
#

. "$HOME/scripts/globalval.ps1"

$TgtPatch="$HOME/scripts/0.target/tgt_gs_patch.csv"
$PatchFile="$HOME/scripts/_Patch_file_name"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias 
	#
	Copy-DatastoreItem -Item $PatchFile -Destination $f.lun-name
	echo $f.ip	
}
Disconnect-VIServer -Server * -Force -confirm:$false
