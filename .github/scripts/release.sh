#!/bin/bash
cd kubesmith
rm -f ../build/kubesmith-*.tar.gz
collection="${2%*/}"
echo "Releasing collection $collection"
ansible-galaxy collection build $collection --output-path ../build
ansible-galaxy collection publish ../build/kubesmith-$collection-*.tar.gz --api-key $1
