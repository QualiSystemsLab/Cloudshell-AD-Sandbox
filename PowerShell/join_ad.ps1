# Get Network Adapter Index
$defaultNic = Get-NetAdapter | Select ifIndex
$defaultGW = Get-NetIPConfiguration -InterfaceIndex $defaultNic[0].ifIndex | Foreach IPv4DefaultGateway

# Set DNS Servers
Set-DNSClientServerAddress -interfaceIndex $defaultNic[0].ifIndex -ServerAddresses ($env:DC_IP_ADDRESS,$defaultGW.NextHop)

Start-Sleep -Seconds 60

$domain = $env:DOMAIN_NAME
$password = $env:DOMAIN_ADMIN_PASS | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\$env:DOMAIN_ADMIN_USER"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
