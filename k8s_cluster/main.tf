module "cluster" {
  source         = "./computing"
  cluster_labels = var.cluster_labels
  cluster_sizing = var.cluster_sizing
}

resource "hcloud_network" "cluster" {
  name     = "cluster-network"
  ip_range = "10.192.0.0/11"
}


resource "hcloud_network_subnet" "public" {
  network_id   = hcloud_network.cluster.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.200.0.0/13"
}



resource "hcloud_server_network" "master" {
  count     = length(module.cluster.cluster.masters)
  server_id = module.cluster.cluster.masters[count.index].id
  subnet_id = hcloud_network_subnet.public.id
}
#
resource "hcloud_server_network" "workers" {
  count     = length(module.cluster.cluster.workers)
  server_id = module.cluster.cluster.workers[count.index].id
  subnet_id = hcloud_network_subnet.public.id
}


# TODO Refectore sleep to Dynamic Wait for Cloud-Init Finished on all nodes
resource "time_sleep" "cluster_ecs_finished" {
  depends_on = [
    hcloud_server_network.workers,
    hcloud_server_network.master,
    module.cluster,
  ]
  create_duration = "120s"
}

# Bootstrap the nodes with commons playbooks
module "bootstrap" {
  depends_on             = [time_sleep.cluster_ecs_finished]
  source                 = "git::https://github.com/nolte/ansible_playbook-baseline-online-server.git//terraform/configure?ref=v1.0.0"
  ansible_inventory_path = var.ansible_inventory_path
}
