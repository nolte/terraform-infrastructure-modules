variable "hostname_prefix" {
  type = string

}

resource "random_pet" "name" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    hostname_prefix = "${var.hostname_prefix}"
  }
}
data "hcloud_ssh_key" "machine_key" {
  with_selector = "usage=machine"
}

data "hcloud_ssh_key" "private_key" {
  with_selector = "usage=manual"
}

variable "node_labels" {
  type = map(string)
}

variable "node_information" {
  type = object({
    flavor = string
  })
}
module "this" {
  source = "../../../computing_elements"

  computing_instance_name                   = format("%s-%s", var.hostname_prefix, random_pet.name.id)
  computing_instance_usage_root_key         = data.hcloud_ssh_key.machine_key.id
  computing_instance_labels                 = var.node_labels
  computing_instance_ssh_machine_key_id_var = data.hcloud_ssh_key.machine_key.public_key
  computing_instance_ssh_private_key_id_var = data.hcloud_ssh_key.private_key.public_key
  computing_instance_flavour                = var.node_information.flavor
  computing_instance_image                  = "centos-8"
}

output "this" {
  value = module.this.this
}
