#!/bin/bash

echo ""
echo "My Installer"
echo ""

DESTINATION="devops-exam"

#mkdir -p ${DESTINATION}
tar -czvf ${DESTINATION}.tar.gz ~/app/devops-exam


echo "Successed"
exit 0 


