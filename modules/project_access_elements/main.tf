/**
 * # TF Module Access Element
 *
 * Using Existing SSH Key from Pass (Password Store) as HCloud SSH Access Key.
 */

data "pass_password" "ssh_public_key" {
  path = var.pass_path
}


resource "hcloud_ssh_key" "management_key" {
  name       = var.name
  public_key = data.pass_password.ssh_public_key.password
  labels     = var.labels
}
