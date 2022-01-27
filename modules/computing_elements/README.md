# TF Module Compute Element

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Resources

| Name | Type |
|------|------|
| [hcloud_server.computing_instance](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/resources/server) | resource |
| [hcloud_image.default_base_image](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/data-sources/image) | data source |
| [template_cloudinit_config.config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |
| [template_file.cloudinit_base](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.cloudinit_pre_configured_files](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.cloudinit_users](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_computing_instance_additional_volumes_cloud_init"></a> [computing\_instance\_additional\_volumes\_cloud\_init](#input\_computing\_instance\_additional\_volumes\_cloud\_init) | Additional Volumes Cloud Init Configs, can be used for add existing Volumes to your Configuration. | `string` | `""` | no |
| <a name="input_computing_instance_flavour"></a> [computing\_instance\_flavour](#input\_computing\_instance\_flavour) | Compute Instance Flavor | `string` | `"cx11"` | no |
| <a name="input_computing_instance_image"></a> [computing\_instance\_image](#input\_computing\_instance\_image) | Compute Instance Image, like Centos | `string` | `"centos-8"` | no |
| <a name="input_computing_instance_labels"></a> [computing\_instance\_labels](#input\_computing\_instance\_labels) | Compute Instance labels for better management. | `map(string)` | `{}` | no |
| <a name="input_computing_instance_location"></a> [computing\_instance\_location](#input\_computing\_instance\_location) | Compute Instance Location | `string` | `"hel1"` | no |
| <a name="input_computing_instance_name"></a> [computing\_instance\_name](#input\_computing\_instance\_name) | Name from the managed Compute Instance | `string` | n/a | yes |
| <a name="input_computing_instance_ssh_machine_key_id_var"></a> [computing\_instance\_ssh\_machine\_key\_id\_var](#input\_computing\_instance\_ssh\_machine\_key\_id\_var) | Public Key for SSH Compute Instance access | `sting` | n/a | yes |
| <a name="input_computing_instance_usage_root_key"></a> [computing\_instance\_usage\_root\_key](#input\_computing\_instance\_usage\_root\_key) | The Machine Key for Root SSH Access. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_computing_instance_id"></a> [computing\_instance\_id](#output\_computing\_instance\_id) | The technical ID from the managed instance |
