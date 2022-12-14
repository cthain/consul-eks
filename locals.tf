locals {
  name           = var.name != "" ? var.name : random_string.name[0].result
  is_enterprise  = var.consul_license_path != ""
  consul_license = local.is_enterprise ? file(var.consul_license_path) : "noop"
}

resource "random_string" "name" {
  count   = var.name == "" ? 1 : 0
  length  = 8
  special = false
}
