# Variables for jAIMSnet production environment
# Last Updated: 2026-03-06

variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "atl1"
}

variable "cluster_name" {
  description = "DOKS cluster name"
  type        = string
  default     = "jaimsnet-cluster"
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.34.1-do.0"
}
