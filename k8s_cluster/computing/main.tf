module "masters" {
  for_each         = var.cluster_sizing.masters
  source           = "./node_group_metadata"
  hostname_prefix  = "mst"
  node_information = each.value
  node_labels = merge(merge(var.cluster_labels, {
    type    = "master"
    typeset = each.key
  }), each.value.labels)
}

module "workers" {
  for_each         = var.cluster_sizing.workers
  source           = "./node_group_metadata"
  hostname_prefix  = "wrk"
  node_information = each.value
  node_labels = merge(merge(var.cluster_labels, {
    type    = "worker"
    typeset = each.key
  }), each.value.labels)
}

output "cluster" {
  value = {
    masters = flatten(values(module.masters)[*].this)
    workers = flatten(values(module.workers)[*].this)
  }
}
