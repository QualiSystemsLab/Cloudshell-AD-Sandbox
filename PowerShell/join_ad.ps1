# Get Network Adapter Index
$defaultNic = Get-NetAdapter | Select ifIndex
$defaultGW = Get-NetIPConfiguration -InterfaceIndex $defaultNic[0].ifIndex | Foreach IPv4DefaultGateway

# Set DNS Servers
Set-DNSClientServerAddress -interfaceIndex $defaultNic[0].ifIndex -ServerAddresses $env:AD_IP

# Sleep wait for AD to finish reboot
Start-Sleep -Seconds 360

$domain = $env:AD_DOMAIN_NAME
$password = $env:ADMIN_PASSWORD | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\Administrator"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
shutdown -r -t 5
exit 0
