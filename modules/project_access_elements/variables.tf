variable "name" {
  description = "Element Name"
}
variable "pass_path" {
  description = "Pass Path, from the public key."
}
variable "labels" {
  type        = map(string)
  description = "Labels for Ressourcen Management."
}
