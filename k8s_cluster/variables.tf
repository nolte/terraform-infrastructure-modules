

variable "cluster_labels" {
  default = {}
}

variable "cluster_sizing" {
  type = object({
    masters = map(any),
    workers = map(any),
  })
}

variable "ansible_inventory_path" {
  type = string
}
