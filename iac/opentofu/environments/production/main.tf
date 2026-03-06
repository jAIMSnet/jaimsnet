# jAIMSnet — OpenTofu Production Environment
# Provider: DigitalOcean
# Last Updated: 2026-03-06
# Status: TODO — Phase 3

# TODO: Configure DigitalOcean provider
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  # TODO: Configure remote state backend
  # backend "s3" {
  #   endpoint = "nyc3.digitaloceanspaces.com"
  #   bucket   = "jaimsnet-tfstate"
  #   key      = "production/terraform.tfstate"
  #   ...
  # }
}

provider "digitalocean" {
  token = var.do_token
}

# TODO: Use modules to provision infrastructure
# module "vpc" {
#   source = "../../modules/vpc"
#   ...
# }

# module "doks_cluster" {
#   source = "../../modules/doks-cluster"
#   ...
# }
