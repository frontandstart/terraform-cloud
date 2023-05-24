# Stage: terraform-cloud-gcp
FROM google/cloud-sdk:alpine as gcp

COPY --from=hashicorp/terraform:1.5.0-beta1 /bin/terraform /bin

RUN apk update && apk upgrade && apk add curl bash openssl tar xz
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -rf kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Stage: terraform-cloud-aws
FROM amazon/aws-cli:latest as aws

COPY --from=hashicorp/terraform:1.5.0-beta1 /bin/terraform /bin

RUN yum update -y && yum upgrade -y && yum install -y curl bash openssl tar
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -rf kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Stage: terraform-cloud-azure
FROM mcr.microsoft.com/azure-cli as azure

COPY --from=hashicorp/terraform:1.5.0-beta1 /bin/terraform /bin

RUN apk update && apk upgrade && apk add curl bash openssl tar
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -rf kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Stage: terraform-cloud-do
FROM digitalocean/doctl:latest as digitalocean

COPY --from=hashicorp/terraform:1.5.0-beta1 /bin/terraform /bin

RUN apk update && apk upgrade && apk add curl bash openssl tar
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -rf kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash