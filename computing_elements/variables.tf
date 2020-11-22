variable "computing_instance_usage_root_key" {}
variable "computing_instance_name" {}

variable "computing_instance_location" {
  default = "hel1"
}
variable "computing_instance_flavour" {
  default = "cx11"
}
variable "computing_instance_image" {
  default = "centos-8"
}

variable "computing_instance_labels" {
  type    = "map"
  default = {}
}

variable "computing_instance_ssh_machine_key_id_var" {

}

variable "computing_instance_ssh_private_key_id_var" {

}

variable "computing_instance_additional_volumes_cloud_init" {
  default = ""

}
