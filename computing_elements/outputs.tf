output "computing_instance_id" {
  value = "${hcloud_server.computing_instance.id}"
}

output "this" {
  value = hcloud_server.computing_instance
}
