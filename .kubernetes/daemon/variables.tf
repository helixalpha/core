# Used to emulate depends_on for the module.
# https://medium.com/@bonya/terraform-adding-depends-on-to-your-custom-modules-453754a8043e
variable depends_on {
  type    = "list"
  default = []
}

variable "data_path" {
  type    = "string"
  default = "/root/.helixalpha"
}

variable "replica_count" {
  type    = "string"
  default = "1"
}
