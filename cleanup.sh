#!/bin/bash -eu
# Bastion host details

# Local file/directory to sync
LOCAL_PATH="/local/path"
rsync -r -e "ssh bastion ssh" breachresult.txt target:/opt/
# Connect to the destination server via the bastion host and perform rsync
