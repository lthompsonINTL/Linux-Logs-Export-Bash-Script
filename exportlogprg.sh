#!/bin/bash

###################################

# Copy the logs to be exported to the exportlogs folder, which will be zipped and sent to the ops server

##################################


echo ""
echo ""

sudo cp /var/log/cloud-init.log /var/log/exportlogs/cloud-init.log

sudo cp /var/log/cloud-init-output.log /var/log/exportlogs/cloud-init-output.log

sudo cp /var/log/dnf.librepo.log /var/log/exportlogs/dnf.librepo.log

sudo cp /var/log/dnf.log /var/log/exportlogs/dnf.log

sudo cp /var/log/lastlog /var/log/exportlogs/lastlog

sudo cp /var/log/tallylog /var/log/exportlogs/tallylog


################################

# Compress and zip the files, date the zip file,and empty the exportlogs folder for the next day of log files

################################

cd /

cd /var/log/exportlogs

zipfilename="exportlogs_$(date +"%Y-%m-%d-%H-%M").zip"

sudo zip -r "$zipfilename" .  ######  /var/log/exportlogs 


echo ""
echo ""
echo "Created: $zipfilename"


###############################

# Send the zip file to the LinuxOpsServer

## ############################

sudo rsync -av -e "ssh -i /home/ec2-user/.ssh/linux-ops.pem" $zipfilename  ec2-user@172.31.18.180:/home/ec2-user/folder/

sudo rm "$zipfilename"

echo""
echo""
echo "Zipped logs from /var/log were compressed, named $zipfilename and was sent to LinxOpsServer in zip format " 
echo""
