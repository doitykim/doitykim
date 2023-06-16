#
# Bind iscsi kernel 
#

. "$HOME/scripts/globalval.ps1"

#
# get-vmhost irvs01.iroo.int|get-vmhosthba -type IScsi |where {$_.Model -eq "iSCSI Software Adapter"} |Select -ExpandProperty Device -first 1
#

foreach ($f in (import-csv -path $TgtFile))
{
        echo $f.alias
        $esxcli = Get-Esxcli -vmhost $f.alias -V2
        $esxcli.iscsi.networkportal.add.invoke(@{adapter=$iscsi_adapter; nic=$iscsi_vmk1; force=$true})
        $esxcli.iscsi.networkportal.add.invoke(@{adapter=$iscsi_adapter; nic=$iscsi_vmk2; force=$true})
}
Disconnect-VIServer -Server * -Force -confirm:$false
