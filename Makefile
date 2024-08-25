MKFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ANSIBLE_INVENTORY_DIR := $(MKFILE_DIR)/example/inventory
ANSIBLE_DIR := $(MKFILE_DIR)/example
ANSIBLE_USER := margay

.ONESHELL:

.PHONY: example-ansible-requirements
example-ansible-requirements:
	cd $(ANSIBLE_DIR)
	test -d $(ANSIBLE_DIR)/.venv || python3 -m virtualenv $(ANSIBLE_DIR)/.venv
	. $(ANSIBLE_DIR)/.venv/bin/activate
	pip install -r $(ANSIBLE_DIR)/requirements.txt
	ansible-galaxy collection install --force-with-deps -r $(ANSIBLE_DIR)/requirements.yml

.PHONY: example-provision
example-provision: example-ansible-requirements
	cd $(ANSIBLE_DIR)
	. $(ANSIBLE_DIR)/.venv/bin/activate
	ansible-playbook -i $(ANSIBLE_INVENTORY_DIR)/main.yaml playbooks/provision.yaml -u $(ANSIBLE_USER) -K

.PHONY: release
release:
	echo "Releasing role to Ansible Galaxy"
	bash $(MKFILE_DIR)/.github/scripts/release.sh $(GALAXY_API_KEY) $(COLLECTION_NAME)
