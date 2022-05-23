################################################################
"resource Group :"

#southcentralus centralus francecentral westus2 eastus centralus 
$Global:RGLocation = "centralus"
$Global:RGName = "vmss-rg"



#######################################################################
# Steps :

az group create --name $RGName --location $RGLocation

."commands\ScaleSet\VMSS_create.ps1"

."commands\ScaleSet\VMSS_create_all.ps1"








