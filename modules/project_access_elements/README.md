# TF Module Access Element

Using Existing SSH Key from Pass (Password Store) as HCloud SSH Access Key.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | n/a |
| <a name="provider_pass"></a> [pass](#provider\_pass) | n/a |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key.management_key](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/resources/ssh_key) | resource |
| [pass_password.ssh_public_key](https://registry.terraform.io/providers/hashicorp/pass/latest/docs/data-sources/password) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | Labels for Ressourcen Management. | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Element Name | `any` | n/a | yes |
| <a name="input_pass_path"></a> [pass\_path](#input\_pass\_path) | Pass Path, from the public key. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | The Id From the Managed SSH Key |
