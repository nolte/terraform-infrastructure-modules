output "computing_instance_id" {
  value       = hcloud_server.computing_instance.id
  description = "The technical ID from the managed instance"
}
