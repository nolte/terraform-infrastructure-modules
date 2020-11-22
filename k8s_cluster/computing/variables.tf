

variable "cluster_labels" {
  default = {}
}

variable "cluster_sizing" {
  type = object({
    masters = map(any),
    workers = map(any),
  })
}


variable "default_instance_flavour" {
  default = "cx11"
}
