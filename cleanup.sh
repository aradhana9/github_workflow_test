#!/bin/bash -eu
rsync -e "ssh -o StrictHostKeyChecking=no" -vz ubuntu@172.16.32.26:"/var/www/community.nuxeo.com/static/drive-staging/versions.yml" .
