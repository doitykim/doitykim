#
# Bind iscsi kernel 
#

. "$HOME/scripts/globalval.ps1"

#
# get-vmhost irvs01.iroo.int|get-vmhosthba -type IScsi |where {$_.Model -eq "iSCSI Software Adapter"} |Select -ExpandProperty Device -first 1
#

foreach ($f in (import-csv -path $TgtFile))
{
        $iscsi_adapter= Get-VMhost $f.alias |Get-VMHostHba -Type IScsi | Where {$_.Model -eq "iSCSI Software Adapter"}
        $iscsi_vmk1 = Get-VMHostNetworkAdapter -PortGroup service-for-iscsi1 |select -ExpandProperty Devicename -first 1
        $iscsi_vmk2 = Get-VMHostNetworkAdapter -PortGroup service-for-iscsi2 |select -ExpandProperty Devicename -first 1

        echo $f.alias
        $esxcli = Get-Esxcli -vmhost $f.alias -V2
        $esxcli.iscsi.networkportal.add.invoke(@{adapter=$iscsi_adapter; nic=$iscsi_vmk1; force=$true})
        $esxcli.iscsi.networkportal.add.invoke(@{adapter=$iscsi_adapter; nic=$iscsi_vmk2; force=$true})

}
Disconnect-VIServer -Server * -Force -confirm:$false
