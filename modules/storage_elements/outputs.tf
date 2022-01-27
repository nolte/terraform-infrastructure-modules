output "storage_volume_id" {
  value       = hcloud_volume.storage_volume.0.id
  description = "The Technical ID from the Managed Volume"
}

output "storage_volume_labels" {
  value       = local.merged_storage_labels
  description = "Labels for the Storage volume."
}

output "storage_volume_linux_device" {
  value       = hcloud_volume.storage_volume.0.linux_device
  description = "Device Type from Managed Volume"
}

output "storage_volume_format" {
  value       = hcloud_volume.storage_volume.0.format
  description = "Volume Format from the Managed Element"
}

output "storage_volume_active" {
  value       = var.storage_active
  description = "Volume State information"
}
