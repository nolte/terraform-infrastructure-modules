# TF Module Storage Element

Manage HCloud Volumes.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.32.2 |

## Resources

| Name | Type |
|------|------|
| [hcloud_volume.storage_volume](https://registry.terraform.io/providers/hetznercloud/hcloud/1.32.2/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_storage_active"></a> [storage\_active](#input\_storage\_active) | If True the storage will be created | `bool` | `true` | no |
| <a name="input_storage_format"></a> [storage\_format](#input\_storage\_format) | Format volume after creation. xfs or ext4 | `string` | `"xfs"` | no |
| <a name="input_storage_labels"></a> [storage\_labels](#input\_storage\_labels) | Labels for the Storage volume. | `map(string)` | `{}` | no |
| <a name="input_storage_location"></a> [storage\_location](#input\_storage\_location) | RZ Location for the Volume, shoud be the same like the Compute Instanze. | `string` | `"hel1"` | no |
| <a name="input_storage_name"></a> [storage\_name](#input\_storage\_name) | The Name of the Data Volume | `string` | n/a | yes |
| <a name="input_storage_size"></a> [storage\_size](#input\_storage\_size) | Size for the Storage Volume | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_volume_active"></a> [storage\_volume\_active](#output\_storage\_volume\_active) | Volume State information |
| <a name="output_storage_volume_format"></a> [storage\_volume\_format](#output\_storage\_volume\_format) | Volume Format from the Managed Element |
| <a name="output_storage_volume_id"></a> [storage\_volume\_id](#output\_storage\_volume\_id) | The Technical ID from the Managed Volume |
| <a name="output_storage_volume_labels"></a> [storage\_volume\_labels](#output\_storage\_volume\_labels) | Labels for the Storage volume. |
| <a name="output_storage_volume_linux_device"></a> [storage\_volume\_linux\_device](#output\_storage\_volume\_linux\_device) | Device Type from Managed Volume |
