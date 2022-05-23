"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"CREATE A VNET :"

$Global:VNETName = "alexeivnet"
$Global:SUBNET1Name = "vm-subnet"
$Global:SUBNET2Name = "ag-subnet"

az network vnet create `
    --resource-group $RGName `
    --location $RGLocation `
    --name $VNETName `
    --address-prefixes 10.1.0.0/16 `

az network vnet subnet create `
    --resource-group $RGName `
    --vnet-name $VNETName `
    --name $SUBNET1Name `
    --address-prefixes 10.1.1.0/24 

az network vnet subnet create `
    --resource-group $RGName `
    --vnet-name $VNETName `
    --name $SUBNET2Name `
    --address-prefixes 10.1.2.0/24 


################################################################
"CREATE VM1 :"

$Global:VM1Name = "alexeivnet1"

az vm create `
    --resource-group $RGName `
    --name $VM1Name `
    --subnet $SUBNET1Name `
    --vnet-name $VNETName `
    --image UbuntuLTS `
    --generate-ssh-keys `
    --public-ip-address VM1-publicIP `
    --admin-username alexei `
    --admin-password Alexei.80.test

$IP1 = (az vm list-ip-addresses -g $RGName -n $VM1Name `
    | ConvertFrom-Json).virtualMachine.network.publicIpAddresses.ipAddress
"VM1 IP : ${IP1}"


################################################################
"CREATE VM2 :"

$Global:VM2Name = "alexeivnet2"

az vm create `
    --resource-group $RGName `
    --name $VM2Name `
    --subnet $SUBNET2Name `
    --vnet-name $VNETName `
    --image UbuntuLTS `
    --generate-ssh-keys `
    --public-ip-address VM2-publicIP `
    --admin-username alexei `
    --admin-password Alexei.80.test

$IP2 = (az vm list-ip-addresses -g $RGName -n $VM2Name `
    | ConvertFrom-Json).virtualMachine.network.publicIpAddresses.ipAddress
"VM2 IP : ${IP2}"



    






















# ################################################################
# "LOAD BALANCER configuration :"

# $Global:VMSSLoadBalancer = "alexeilb"
# "VMSS Load Balancer : "  + $VMSSLoadBalancer


# ################################################################
# "CREATE A LOAD BALANCER :"

# az network lb create `
#     --resource-group $RGName `
#     --name $VMSSLoadBalancer `
#     --sku Standard `
#     --vnet-name $VNETName `
#     --subnet $SUBNETName `
#     --frontend-ip-name myFrontEnd `
#     --backend-pool-name myBackEndPool


# ################################################################
# "VMSS configuration :"

# $Global:VMSSName = "alexeivmss"
# "VMSS name : "  + $VMSSName

# $Global:VMSSImage = "UbuntuLTS"
# "VMSS Image : "  + $VMSSImage

# # Standard_DS1_v2 Standard_B1ls Standard_E16bds_v5
# $Global:VMSSSKU = "Standard_E16bds_v5"
# "SKU : "  + $Global:VMSSSKU

# $Global:VMSSAdmin = "alexeiadmin"
# "VMSS Admin user name : "  + $VMSSAdmin

# # The password length must be between 12 and 72. 
# # Password must have the 3 of the following: 
# # 1 lower case character, 1 upper case character, 1 number and 1 special character.
# $Global:VMSSPassword = "Alexeipw.1234"
# "VMSS Admin Password : "  + $VMSSPassword

# $Global:VMSSCustomData = "cloud-init.txt"
# "VMSS Custom Data : "  + $VMSSCustomData

# $Global:VMSSInstanceCount = 2
# "VMSS Instance Count : "  + $VMSSInstanceCount


# ################################################################
# "CREATE A VMSS :"

# az vmss create `
#     --name $VMSSName `
#     --resource-group $RGName `
#     --image $VMSSImage `
#     --vm-sku $VMSSSKU `
#     --load-balancer $VMSSLoadBalancer `
#     --admin-username $VMSSAdmin `
#     --admin-password $VMSSPassword `
#     --custom-data $VMSSCustomData `
#     --instance-count $VMSSInstanceCount
#     # --public-ip-address-dns-name my-globally-dns-name `
#     # --vnet-name MyVnet `
#     # --subnet MySubnet `
#     # --generate-ssh-keys
#     # --admin-password

    