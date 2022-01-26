variable "storage_name" {
  description = "The Name of the Data Volume"
}

variable "storage_format" {
  default     = "xfs"
  description = "Format volume after creation. xfs or ext4"
}

variable "storage_size" {
  default     = 10
  description = "Size for the Storage Volume"
}

variable "storage_location" {
  default = "hel1"
}

variable "storage_active" {
  default     = true
  description = "If True the storage will be created"
}

variable "storage_labels" {
  type        = map(string)
  description = "Labels for the Storage volume."
  default     = {}
}
