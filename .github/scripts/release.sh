#!/bin/bash
cd kubesmith
for collection in cri k8s oci; do
  collection="${collection%*/}"
  echo "Releasing collection $collection"
  ansible-galaxy collection build $collection --output-path ../build
  ansible-galaxy collection publish $collection-*.tar.gz --api-key $1
done
