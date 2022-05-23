"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"



################################################################
"Storage Account configuration :"

$Global:SAName = "flaskstorageaccount"
"Storage Account name : " + $SAName

#southcentralus centralus francecentral
$Global:SALocation = $RGLocation
"Storage Account Location : " + $SALocation

$Global:SAKind = "BlockBlobStorage"
"Storage Account kind : " + $SAKind

$Global:SASKU = "Standard_LRS"
"Storage Account SKU : " + $SASKU

$Global:SCName = "flask-images"
"Storage container name : " + $SCName

$Global:SCAuthMode = "login"
"Storage container auth mode : " + $SCAuthMode

$Global:SCPublicAccess = "container"
"Storage container public access : " + $SCPublicAccess



#######################################################################
"Set config file :"

$file = ".\commands\Configs\var.cfg"

#ne pas faire deux fois cette commande
# (Get-Content -Path $file) | ForEach-Object { $_ = $_.split("=")[0]; $_ } | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_ACCOUNT=' + $SAName; $_ -Replace 'BLOB_ACCOUNT', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_CONTAINER=' + $SCName; $_ -Replace 'BLOB_CONTAINER', $rep } | Set-Content -Path $file




################################################################
"Create the block blob storage account :"

az storage account create `
    --resource-group $RGName `
    --name $SAName `
    --location $SALocation `
    --sku $SASKU
    #--kind $SAKind `


################################################################
"Create the container :"

az storage container create `
 --account-name $SAName `
 --name $SCName `
 --auth-mode $SCAuthMode `
 --public-access $SCPublicAccess


#######################################################################
# Next step :

# $script = "commands\CosmosDb\CosmosDb_create.ps1"
# .$script


