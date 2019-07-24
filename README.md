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


### Releasing

Must be executed from the ``develop`` branch.

```bash
pre-commit uninstall \
    && bump2version --tag release --commit \
    && git checkout master && git merge develop && git checkout develop \
    && bump2version --no-tag patch --commit \
    && git push origin master --tags \
    && git push origin develop \
    && pre-commit install
```
