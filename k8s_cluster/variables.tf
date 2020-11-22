

variable "cluster_labels" {
  default = {}
}

variable "cluster_sizing" {
  type = object({
    masters = map(any),
    workers = map(any),
  })
}
