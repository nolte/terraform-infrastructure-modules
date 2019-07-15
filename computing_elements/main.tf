

# base masterdata from hcloud provider
data "hcloud_image" "default_base_image" {
  name = "${var.computing_instance_image}"
}


data "template_file" "cloudinit_base" {
  template = "${file("${path.module}/cloudinit_templates/cloudinit.yml")}"
}

data "template_file" "cloudinit_users" {
  template = "${file("${path.module}/cloudinit_templates/cloudinit users.yml.tp")}"

  vars = {
    ssh_machine_key_id = "${var.computing_instance_ssh_machine_key_id_var}"
    ssh_private_key_id = "${var.computing_instance_ssh_private_key_id_var}"
  }
}


data "template_cloudinit_config" "config" {
  # Main cloud-config configuration file.
  base64_encode = false
  gzip          = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_base.rendered}"
  }
  part {
    filename     = "users.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_users.rendered}"
  }
  part {
    filename     = "mounts.cfg"
    content_type = "text/cloud-config"
    content      = "${var.computing_instance_additional_volumes_cloud_init}"
  }
}

locals {
  computing_instance_labels_merged = "${var.computing_instance_labels}"
}



resource "hcloud_server" "computing_instance" {
  name        = "${var.computing_instance_name}"
  image       = "${data.hcloud_image.default_base_image.name}"
  user_data   = "${data.template_cloudinit_config.config.rendered}"
  server_type = "${var.computing_instance_flavour}"
  ssh_keys    = ["${var.computing_instance_usage_root_key}"]
  location    = "${var.computing_instance_location}"
  labels      = "${local.computing_instance_labels_merged}"
}
