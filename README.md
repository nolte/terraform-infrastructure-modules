# Terraform Modules

[![Github Project Stars](https://img.shields.io/github/stars/nolte/terraform-infrastructure-modules.svg?label=Stars&style=social)](https://github.com/nolte/terraform-infrastructure-modules) [![Travis CI build status](https://travis-ci.org/nolte/terraform-infrastructure-modules.svg?branch=master)](https://travis-ci.org/nolte/terraform-infrastructure-modules) [![Documentation Status](https://readthedocs.org/projects/terraform-infrastructure-modules/badge/?version=latest)](https://terraform-infrastructure-modules.readthedocs.io/en/stable/?badge=stable) [![Github Issue Tracking](https://img.shields.io/github/issues-raw/nolte/terraform-infrastructure-modules.svg)](https://github.com/nolte/terraform-infrastructure-modules) [![Github LatestRelease](https://img.shields.io/github/release/nolte/terraform-infrastructure-modules.svg)](https://github.com/nolte/terraform-infrastructure-modules)

Repository for Shared, reuseable Terraform Modules.  At the Moment the modules only useable for the [hetzner.de/cloud](https://hetzner.de/cloud), with the [terraform](https://www.terraform.io/docs/providers/hcloud/index.html) Provider.


## Usage

```terraform
module "private_access_key" {
    source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//[module_name]?ref=v0.0.5.dev"
    ...
}
```

### Modules

| module                      | description                                                                                                                                                             |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ``project_access_elements`` | Handle the Accees Keys from a Project (wrapper for the [hcloud_ssh_key](https://www.terraform.io/docs/providers/hcloud/r/ssh_key.html)).                                |
| ``storage_elements``        | Handle Storage Volumes (wrapper for [hcloud_volume](https://www.terraform.io/docs/providers/hcloud/r/volume.html)).                                                     |
| ``computing_elements``      | Handle Computing Instances (wrapper for [hcloud_server](https://www.terraform.io/docs/providers/hcloud/r/server.html)), execute a preconfiguration with ``CloudInit``.  |


## Development


```bash
virtualenv -p python3 ~/venvs/development
source ~/venvs/development/bin/activate
pip install -r requirements.txt
pre-commit install
```

Add Required asdf Plugin Repositories for install additional tools.

```sh
asdf plugin-add terraform-docs https://github.com/looztra/asdf-terraform-docs
asdf plugin-add task https://github.com/nolte/asdf-task.git
```

```sh
asdf install 
```

List Existing tasks

```sh
$ task -l

task: Available tasks for this project:
* default:                              Generate All Module Readme Files
* tfdocs_computing_elements:            Readme for Computing Elements
* tfdocs_project_access_elements:       Readme for Project Access Elements
* tfdocs_storage_elements:              Readme for Storage Elements
```

### Testing

```
export PASSWORD_STORE_DIR=~/.password-store
export HCLOUD_TOKEN=$(pass internet/hetzner.com/projects/minecraft/terraform-token) 
export TF_machine_access_pass_path=private/keyfiles/ssh/online/onlineSecond_rsa.pub

go test -v -timeout 30m
```

###  Docs

```bash
tox -e docs
```
## Links

* [nolte/gh-plumbing](https://github.com/nolte/gh-plumbing) for a standardized build process.
* [hcloud](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs) Terraform Provider.
