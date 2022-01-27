variable "computing_instance_usage_root_key" {
  description = "The Machine Key for Root SSH Access."
  type        = string
}

variable "computing_instance_name" {
  description = "Name from the managed Compute Instance"
  type        = string
}

variable "computing_instance_location" {
  default     = "hel1"
  description = "Compute Instance Location"
}

variable "computing_instance_flavour" {
  default     = "cx11"
  description = "Compute Instance Flavor"
}

variable "computing_instance_image" {
  default     = "rocky-8"
  description = "Compute Instance Image, like Centos"
}

variable "computing_instance_labels" {
  type        = map(string)
  default     = {}
  description = "Compute Instance labels for better management."
}

variable "computing_instance_ssh_machine_key_id_var" {
  description = "Public Key for SSH Compute Instance access"
  type        = string
}

variable "computing_instance_additional_volumes_cloud_init" {
  default     = ""
  description = "Additional Volumes Cloud Init Configs, can be used for add existing Volumes to your Configuration."
}
