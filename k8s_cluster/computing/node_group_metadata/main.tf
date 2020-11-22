
variable "hostname_prefix" {
  type = string
}
variable "node_labels" {
  type = map(string)
}


variable "node_information" {
  type = object({
    flavor    = string
    nodeCount = number
  })
}

module "this" {
  count            = var.node_information.nodeCount
  source           = "../node_metadata"
  hostname_prefix  = format("%s", var.hostname_prefix)
  node_information = var.node_information
  node_labels      = var.node_labels
}
output "this" {
  value = flatten(module.this[*].this)
}
