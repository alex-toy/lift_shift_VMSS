"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
"VNET configuration :"

$Global:VNETName = "alexeivnet"
"VNET Name : "  + $VNETName

$Global:SUBNETName = "alexeibackendsubnet"
"SUBNET Name : "  + $SUBNETName


################################################################
"CREATE A VNET :"

az network vnet create `
    --resource-group $RGName `
    --location $RGLocation `
    --name $VNETName `
    --address-prefixes 10.1.0.0/16 `
    --subnet-name $SUBNETName `
    --subnet-prefixes 10.1.0.0/24


################################################################
"LOAD BALANCER configuration :"

$Global:VMSSLoadBalancer = "alexeilb"
"VMSS Load Balancer : "  + $VMSSLoadBalancer


################################################################
"CREATE A LOAD BALANCER :"

az network lb create `
    --resource-group $RGName `
    --name $VMSSLoadBalancer `
    --sku Standard `
    --vnet-name $VNETName `
    --subnet $SUBNETName `
    --frontend-ip-name myFrontEnd `
    --backend-pool-name myBackEndPool


################################################################
"VMSS configuration :"

$Global:VMSSName = "alexeivmss"
"VMSS name : "  + $VMSSName

$Global:VMSSImage = "UbuntuLTS"
"VMSS Image : "  + $VMSSImage

# Standard_DS1_v2 Standard_B1ls
$Global:VMSSSKU = "Standard_B1ls"
"SKU : "  + $Global:VMSSSKU

$Global:VMSSAdmin = "alexeiadmin"
"VMSS Admin user name : "  + $VMSSAdmin

# The password length must be between 12 and 72. 
# Password must have the 3 of the following: 
# 1 lower case character, 1 upper case character, 1 number and 1 special character.
$Global:VMSSPassword = "Alexeipw.1234"
"VMSS Admin Password : "  + $VMSSPassword

$Global:VMSSCustomData = "cloud-init.txt"
"VMSS Custom Data : "  + $VMSSCustomData

$Global:VMSSInstanceCount = 2
"VMSS Instance Count : "  + $VMSSInstanceCount


################################################################
"CREATE A VMSS :"

az vmss create `
    --name $VMSSName `
    --resource-group $RGName `
    --image $VMSSImage `
    --vm-sku $VMSSSKU `
    --load-balancer $VMSSLoadBalancer `
    --admin-username $VMSSAdmin `
    --admin-password $VMSSPassword `
    --custom-data $VMSSCustomData `
    --instance-count $VMSSInstanceCount
    # --public-ip-address-dns-name my-globally-dns-name `
    # --vnet-name MyVnet `
    # --subnet MySubnet `
    # --generate-ssh-keys
    # --admin-password

    