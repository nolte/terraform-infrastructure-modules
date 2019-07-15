# Terraform Modules

Repository for Shared, reuseable Terraform Modules.  At the Moment the modules only useable for the [hetzner.de/cloud](https://hetzner.de/cloud), with the [terraform](https://www.terraform.io/docs/providers/hcloud/index.html) Provider.


```bash
virtualenv -p python3 ~/venvs/development
source ~/venvs/development/bin/activate
pip install -r requirements.txt
pre-commit install
```


## Usage

```terraform
module "private_access_key" {
    source = "git::https://github.com/nolte/terraform-infrastructure-modules.git?ref=v0.0.2.dev"
    name      = "private_access"
    pass_path = "${var.private_access_pass_path}"
    labels = {
        usage = "manual"
    }
}
```

### Releasing

Must be executed from the ``develop`` branch.

```bash
pre-commit uninstall \
    && bumpversion --tag release --commit \
    && git checkout master && git merge develop && git checkout develop \
    && bumpversion --no-tag patch --commit \
    && git push origin master --tags \
    && git push origin develop \
    && pre-commit install
```
