terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

variable "machine_access_pass_path" {

}

module "management_access_key" {
  source = "../../modules/project_access_elements"

  name      = "testing-key"
  pass_path = var.machine_access_pass_path
  labels = {
    usage = "terratest"
  }
}


output "hello_world" {
  value = module.management_access_key.key_id
}