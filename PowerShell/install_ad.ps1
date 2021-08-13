Import-Module ADDSDeployment
$password = ConvertTo-SecureString $env:ADMIN_PASSWORD -AsPlainText -Force
Add-WindowsFeature -name ad-domain-services -IncludeManagementTools
Install-ADDSForest -CreateDnsDelegation:$false -DomainMode Win2012R2 -DomainName $env:AD_DOMAIN_NAME -DomainNetbiosName $env:AD_NETBIOS_NAME -ForestMode Win2012R2 -InstallDns:$true -SafeModeAdministratorPassword $password -Force:$true
shutdown -r -t 5
exit 0
