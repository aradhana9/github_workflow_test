#!/bin/bash -eu
rsync -e "ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o ConnectTimeout=10 -o 'ControlPath=\"/home/ubuntu/.ansible/cp/5d045f4b19\"'" -avz breachresult.txt ubuntu@172.16.32.26:/opt
# Bastion host details
BASTION_HOST="52.2.219.159"
BASTION_USER="ubuntu"
BASTION_KEY="path/to/bastion_key.pem"

# Destination server details
DESTINATION_PRIVATE_IP="172.16.48.234"
DESTINATION_USER="destination_user"
DESTINATION_KEY="path/to/destination_key.pem"
DESTINATION_PATH="/path/to/destination"

# Local file/directory to sync
LOCAL_PATH="/local/path"

# Connect to the destination server via the bastion host and perform rsync
ssh -i "$BASTION_KEY" -o ProxyJump="$BASTION_USER@$BASTION_HOST" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$DESTINATION_USER@$DESTINATION_PRIVATE_IP" "rsync -avz -e 'ssh -i $DESTINATION_KEY' $LOCAL_PATH $DESTINATION_USER@$DESTINATION_PRIVATE_IP:$DESTINATION_PATH"

