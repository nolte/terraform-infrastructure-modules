# Permanent storage for the minio datas
locals {
  merged_storage_labels = "${var.storage_labels}"
}

# Permanent Volume for the runtime Data, and restoring existing buckets
resource "hcloud_volume" "storage_volume" {
  count    = "${var.storage_active == true ? 1 : 0}"
  name     = "${var.storage_name}"
  size     = "${var.storage_size}"
  format   = "${var.storage_format}"
  labels   = "${local.merged_storage_labels}"
  location = "${var.storage_location}"
}
