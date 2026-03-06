# OpenTofu — Infrastructure Provisioning

| Field | Value |
|-------|-------|
| **Tool** | OpenTofu (Terraform-compatible) |
| **Provider** | DigitalOcean |
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Overview

OpenTofu manages infrastructure provisioning — DOKS cluster, Droplets, Managed PostgreSQL, DNS, VPCs, Load Balancers.

## Structure

| Path | Purpose |
|------|---------|
| `environments/production/` | Production environment config |
| `modules/doks-cluster/` | DOKS cluster provisioning |
| `modules/droplet/` | Droplet provisioning |
| `modules/database/` | Managed PostgreSQL provisioning |
| `modules/dns/` | DNS records |
| `modules/vpc/` | VPC configuration |
