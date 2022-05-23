################################################################
"GENERATE SCRIPTS TO CONNECT TO THE VM AND DEPLOY THE APP :"

#copy a basic Flask app from local machine to the VM
scp -r ./starter ${AdminUsername}@${IP}:/home/${AdminUsername}

#connect to the VM
ssh ${AdminUsername}@${IP}



