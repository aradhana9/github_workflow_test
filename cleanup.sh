#!/bin/bash -eu
rsync -e "ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o ConnectTimeout=10 -o 'ControlPath=\"/home/ubuntu/.ansible/cp/5d045f4b19\"'" -avz breachresult.txt ubuntu@172.16.32.26:/opt

