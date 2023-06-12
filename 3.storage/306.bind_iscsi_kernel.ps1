#
# Bind iscsi kernel 
#

. "$HOME/scripts/globalval.ps1"

#$sw_iscsi = "vmhba64"
#
# get-vmhost irvs01.iroo.int|get-vmhosthba -type IScsi |where {$_.Model -eq "iSCSI Software Adapter"} |Select -ExpandProperty Device -first 1
#

foreach ($f in (import-csv -path $TgtFile))
{

 	$sw_iscsi = Get-VMhost $f.alias |Get-VMHostHba -Type IScsi | Where {$_.Model -eq "iSCSI Software Adapter"}

	echo $f.alias
	$esxcli = Get-Esxcli -vmhost $f.alias -V2
	$esxcli.iscsi.networkportal.add.invoke(@{adapter=$sw_iscsi; nic="vmk2"; force=$true})
	$esxcli.iscsi.networkportal.add.invoke(@{adapter=$sw_iscsi; nic="vmk3"; force=$true})
}
Disconnect-VIServer -Server * -Force -confirm:$false
