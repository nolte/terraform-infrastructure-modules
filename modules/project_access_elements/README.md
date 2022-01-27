# TF Module Access Element

Using Existing SSH Key from Pass (Password Store) as HCloud SSH Access Key.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.32.2 |
| <a name="provider_pass"></a> [pass](#provider\_pass) | 2.0.0 |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key.management_key](https://registry.terraform.io/providers/hetznercloud/hcloud/1.32.2/docs/resources/ssh_key) | resource |
| [pass_password.ssh_public_key](https://registry.terraform.io/providers/camptocamp/pass/2.0.0/docs/data-sources/password) | data source |

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
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | The Public Key From the Managed SSH Key |
