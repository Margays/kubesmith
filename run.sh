#!/bin/bash
source .venv/bin/activate
ansible-playbook -i ./inventory/main.yaml playbooks/provision.yaml -K
