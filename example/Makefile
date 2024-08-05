MKFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ANSIBLE_INVENTORY_DIR := $(MKFILE_DIR)/inventory
ANSIBLE_DIR := $(MKFILE_DIR)
ANSIBLE_USER := margay

.ONESHELL:

.PHONY: ansible-requirements
ansible-requirements:
	test -d $(ANSIBLE_DIR)/.venv || python3 -m virtualenv $(ANSIBLE_DIR)/.venv
	. $(ANSIBLE_DIR)/.venv/bin/activate
	pip install -r $(ANSIBLE_DIR)/requirements.txt
	ansible-galaxy collection install -r $(ANSIBLE_DIR)/requirements.yml

.PHONY: provision
provision: ansible-requirements
	cd $(ANSIBLE_DIR)
	. $(ANSIBLE_DIR)/.venv/bin/activate
	ansible-playbook -i $(ANSIBLE_INVENTORY_DIR)/main.yaml playbooks/provision.yaml -u $(ANSIBLE_USER) -K
