output "storage_volume_id" {
  value = hcloud_volume.storage_volume.0.id
}

output "storage_volume_labels" {
  value = local.merged_storage_labels
}

output "storage_volume_linux_device" {
  value = hcloud_volume.storage_volume.0.linux_device
}

output "storage_volume_format" {
  value = hcloud_volume.storage_volume.0.format
}

output "storage_volume_active" {
  value = var.storage_active
}
