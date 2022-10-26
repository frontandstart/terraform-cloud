FROM hashicorp/terraform:latest as terraform-cloud

RUN apk update && apk add curl bash openssl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -rf kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

ENTRYPOINT [ "" ]

FROM terraform-cloud as terraform-cloud-gcp

COPY --from=gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine /google-cloud-sdk /google-cloud-sdk
ENV PATH /google-cloud-sdk/bin:$PATH

FROM terraform-cloud as terraform-cloud-aws

COPY --from=amazon/aws-cli:latest /usr/local/bin/* /usr/local/bin/

FROM mcr.microsoft.com/azure-cli as terraform-cloud-azure

COPY --from=mcr.microsoft.com/azure-cli /usr/local/bin /usr/local/bin

FROM terraform-cloud as terraform-cloud-do

COPY --from=digitalocean/doctl /app/doctl /usr/local/bin/doctl
