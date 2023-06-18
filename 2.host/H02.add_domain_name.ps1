#
# add dns
#

. "$HOME/scripts/globalval.ps1"

foreach ($f in (import-csv -path $TgtFile))
{
	echo $f.alias
	$vmHostNetworkInfo = Get-VmHostNetwork -Host $f.alias
	#Set-VmHostNetwork -Network $vmHostNetworkInfo -DomainName $domain_name -Dnsaddress $dns_svr
	#Set-VmHostNetwork -HostName $f.hname -Network $vmHostNetworkInfo -DomainName $domain_name -Dnsaddress $dns_svr
	Set-VmHostNetwork -HostName $f.hname -Network $vmHostNetworkInfo -DomainName $domain_name  -Dnsaddress $dns_svr -IPv6Enabled $false
}
Disconnect-VIServer -Server * -Force -confirm:$false
