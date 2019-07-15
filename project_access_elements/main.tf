
data "pass_password" "ssh_public_key" {
  path = "${var.pass_path}"
}


resource "hcloud_ssh_key" "management_key" {
  name       = "${var.name}"
  public_key = "${data.pass_password.ssh_public_key.password}"
  labels     = "${var.labels}"
}
