terraform {
  required_providers {
    pass = {
      source  = "camptocamp/pass"
      version = "2.0.0"
    }

    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.32.2"
    }
  }
}

provider "hcloud" {
}


provider "pass" {
}
