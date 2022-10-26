# Cloud CLI's (Azure, AWS, GCP, Digitalocean) with Terraform, Kubernetes and Helm

[![Build and Push Docker Images](https://github.com/frontandstart/terraform-cloud/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/frontandstart/terraform-cloud/actions/workflows/build.yml)

## Docker Hub

[frontandstart/terraform-cloud](https://hub.docker.com/repository/docker/frontandstart/terraform-cloud)

## What is this?

Docker images help maintain cloud infrastructure with Terraform, Kubernetes and Helm.

Use [docker-compose.yml](./docker-compose.yml) as a reference, add a CLI container to your project to keep
Cloud credentials are isolated from a local machine and use cloud CLI in one command.

## How to use it?

- Add service to docker-compose.yml. See [./docker-compose.yml](./docker-compose.yml) as an example.
- Run `docker compose run aws-cli bash` to get into the container.
- Then as usual use `aws`, `gcloud`, `az` with `terraform`, `kubectl`, and `helm` to log in your cloud account and manage your infrastructure.  
  example for google cloud: `gcloud auth login`, `terraform init`, `terraform plan`, `terraform apply`, `kubectl get pods`, `helm list`  
