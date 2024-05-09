#!/bin/bash -eu
# Bastion host details

# Local file/directory to sync
LOCAL_PATH="/local/path"
rsync -e "ssh -o StrictHostKeyChecking=no" -vz breachresult.txt target:~
# Connect to the destination server via the bastion host and perform rsync
