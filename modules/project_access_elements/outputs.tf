
output "key_id" {
  value       = hcloud_ssh_key.management_key.id
  description = "The Id From the Managed SSH Key"
}
