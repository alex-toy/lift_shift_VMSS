Lift and Shift Migration with Virtual Machine Scale Sets (VMSS)
=
Create a Virtual Machine Scale using Cloud-init to bootstrap a hello world app. Creating custom images is the recommended path to deploy applications in VM scale set in a production environment. However, the purpose of this project is to have a hands-on experience with all the services required to create a Virtual Machine scale set.

In order to execute the bellow instructions, you only need to run **commands\Configs\config.ps1**. All the resources will automatically be deployed for you. At the end, the IP address will be printed at the command line. 

1. Create a resource group with the following settings:
    - name: scaleset-xxx-rg (replace xxx with random numbers)
    - location: closest region to you
2. Create a virtual machine scale set with the following requirements:
    - name: scaleset-xxx (xxx here should match the numbers used in your resource group for organization purposes)
    - image: UbuntuLTS
    - VM Size: costing less than $10 or sku: Standard_B1ls if pricing details is not available in your region
    - OS Disk Type: Premium SSD
    - Load Balancer Type: Azure Load Balancer
    - Admin username: azureuser
    - Custom-data: Use the content in cloud-init.text
3. Update the Azure load balancer with rule to allow web traffic on port 80 for both backend and frontend
4. Find the IP Address and visit the address using your web browser to verify your scale set is configured
5. Cleanup and delete resources : Be sure to clean up and delete resources to avoid recurring charges



