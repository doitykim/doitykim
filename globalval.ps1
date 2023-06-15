#
# PowerShell Script based for Mac
#
# vCenter 정보와 작업 대상 ESXi 서버에 사용될 정보를 저장한 파일을 지정한다.
#
#
$TgtFile = "$HOME/scripts/0.target/tgt_g.csv"
$VcInfoFile = "$HOME/scripts/0.target/vc_vc70.csv"

# ntp server
$time1 = "time1.daumkakao.io" 
$time2 = "time2.daumkakao.io"
$time3 = "time3.daumkakao.io"

# domain name
$domain_name = "virt.onkakao.net"
$dns_svr = "10.20.30.40"

# portgroup
$service_pg = "service-for-v10"
$vmotion_pg = "mgmt-for-vmotion"
$mgmt_pg = "mgmt-for-vcenter"
$iscsi1_pg = "service-for-iscsi1"
$iscsi2_pg = "service-for-iscsi2"

# vlan portgroup
$iscsi1_pg_vlan = "50"
$iscsi2_pg_vlan = "60"
$service_pg_vlan = "10"

#iscsi
$iscsi_adapter="vmhba64"
$iscsi_vmk1="vmk2"
$iscsi_vmk2="vmk3"

# unload module
$unload_module1="bnx2i"
$unload_module2="fcoe"

# Connect to the vCenter Server
foreach ($VcInfo in (import-csv -path $VcInfoFile))
{
        Write-host "Connecting to vCenter Server: " -ForegroundColor Green -NoNewline; Write-Host $VcInfo.vc -ForegroundColor Yellow
        Connect-VIServer -Server $VcInfo.vc -user $VcInfo.user -password $VcInfo.passwd -Protocol https
}
