#
# Add Claim rule
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.ip
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.storage.nmp.satp.rule.add.invoke(@{vendor="DGC"; satp="VMW_SATP_ALUA_CX"; psp="VMW_PSP_RR"; pspoption="iops=1"; claimoption = "tpgs_on"})
#	$esxcli.storage.nmp.satp.rule.remove.invoke(@{vendor="DGC"; satp="VMW_SATP_ALUA_CX"; psp="VMW_PSP_RR"; pspoption="iops=1"; claimoption = "tpgs_on"})
}
Disconnect-VIServer -Server * -Force -confirm:$false
