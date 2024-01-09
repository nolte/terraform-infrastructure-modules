terraform {
  required_providers {
    pass = {
      source  = "camptocamp/pass"
      version = "2.1.1"
    }

    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.33.1"
    }
  }
}
