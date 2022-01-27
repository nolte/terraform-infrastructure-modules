
output "key_id" {
  value       = hcloud_ssh_key.management_key.id
  description = "The Id From the Managed SSH Key"
}

output "public_key" {
  value       = hcloud_ssh_key.management_key.public_key
  description = "The Public Key From the Managed SSH Key"
}