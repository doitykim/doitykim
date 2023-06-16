#
# Copy Local Client File to DataStore
#
# 로컬 파일을 각 클러스터의 공유스토리지로 공유하기
# 별도의 tgt_gs_patch.csv 파일에 공유 스토리지 리스트 필요

. "$HOME/scripts/globalval.ps1"

$TgtPatch="$HOME/scripts/0.target/tgt_gs_patch.csv"
$PatchFile="$HOME/scripts/VMware-ESXi-7.0U3m-21686933-depot.zip"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias 
	#
	$Storepath="vmstore:\gs\"+$f.lun_name+"\"
	Copy-DatastoreItem -Item $PatchFile -Destination $Storepath
	echo $f.ip	
}
Disconnect-VIServer -Server * -Force -confirm:$false
