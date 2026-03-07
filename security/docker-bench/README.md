# docker-bench

Docker host security auditing based on CIS Docker Benchmark.

## Overview

docker-bench audits Docker host configurations on VM-based workloads (GPU nodes, monitoring Droplet) to ensure compliance with security best practices.

## Usage

Run on Docker hosts:
```bash
docker run --rm --net host --pid host --userns host --cap-add audit_control   -v /etc:/etc:ro -v /var/lib:/var/lib:ro -v /var/run/docker.sock:/var/run/docker.sock:ro   docker/docker-bench-security
```

## Checks

- Host configuration
- Docker daemon configuration
- Container images and build files
- Container runtime security
- Docker Security Operations

## Scheduling

Run via Ansible on managed Droplets during security audits.
