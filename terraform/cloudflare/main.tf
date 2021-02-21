terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.17.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Create a record
resource "cloudflare_record" "hosts" {
  for_each = toset( ["test", "test2"] )
  zone_id = var.cloudflare_zone_id
  name    = each.key
  value   = var.cloudflare_dns_host
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_access_group" "groups" {
  account_id                = var.cloudflare_account_id
  name                      = "mutualis"

  include {
    email_domain = ["mutualis.com"]
  }
}

resource "cloudflare_access_application" "applications" {
  for_each                  = toset( ["test", "test2"] )
  account_id                = var.cloudflare_account_id
  name                      = each.key
  domain                    = "${each.key}.${var.cloudflare_domain}"
  session_duration          = "24h"
  auto_redirect_to_identity = true
}

