terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

variable "machine_access_pass_path" {

}

locals {
  common_labels = {
    usage = "terratest"
  }
}

module "management_access_key" {
  source = "../../modules/project_access_elements"

  name      = "testing-key"
  pass_path = var.machine_access_pass_path
  labels    = local.common_labels
}


module "storage" {
  source = "../../modules/storage_elements"

  storage_name   = "terratest-storage"
  storage_size   = 10
  storage_labels = local.common_labels
}


module "computing_element" {
  source = "../../modules/computing_elements"

  computing_instance_name                   = "terratest-vm"
  computing_instance_usage_root_key         = module.management_access_key.key_id
  computing_instance_labels                 = local.common_labels
  computing_instance_ssh_machine_key_id_var = module.management_access_key.public_key
}


resource "hcloud_volume_attachment" "minecraft_computing_volume_runtime" {
  volume_id = module.storage.storage_volume_id
  server_id = module.computing_element.computing_instance_id
  automount = true
}

output "hello_world" {
  value = module.management_access_key.key_id
}
