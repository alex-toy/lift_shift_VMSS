$names = (az network nic list --resource-group $RGName  | ConvertFrom-Json).name
$names

$InboundRuleName = "Port_80"

az network lb inbound-nat-rule create  `
    --resource-group $RGName `
    --lb-name $VMSSLoadBalancer `
    --name $InboundRuleName `
    --protocol Tcp `
    --frontend-port 81 `
    --backend-port 81
    # [--backend-pool-name]
    # [--enable-tcp-reset {false, true}]
    # [--floating-ip {false, true}]
    # [--frontend-ip-name]
    # [--frontend-port]
    # [--frontend-port-range-end]
    # [--frontend-port-range-start]
    # [--idle-timeout]


az network nic ip-config create `
    --resource-group $RGName `
    --name ipconfig1 `
    --nic-name
    # [--app-gateway-address-pools]
    # [--application-security-groups]
    # [--gateway-name]
    # [--lb-address-pools]
    # [--lb-inbound-nat-rules]
    # [--lb-name]
    # [--make-primary]
    # [--private-ip-address]
    # [--private-ip-address-version {IPv4, IPv6}]
    # [--public-ip-address]
    # [--subnet]
    # [--vnet-name]


az network nic ip-config inbound-nat-rule add `
    --resource-group $RGName `
    --nic-name $names[0] `
    --name IPConfig1 `
    --inbound-nat-rule $InboundRuleName `
    --lb-name $VMSSLoadBalancer `
    --ip-config-name ipconfig1
    
