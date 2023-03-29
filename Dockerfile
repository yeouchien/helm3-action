FROM public.ecr.aws/micahhausler/alpine:3.14.0

ENV HELM_3_FILE="helm-v3.7.1-linux-amd64.tar.gz"
ENV KUBECTL_VERSION="v1.25.0"
ENV AWS_IAM_AUTHENTICATOR_VERSION="v0.5.9"

RUN apk add --no-cache ca-certificates jq curl bash nodejs

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
      -o /usr/local/bin/kubectl && \
      chmod +x /usr/local/bin/kubectl


RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/${AWS_IAM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_0.4.0_linux_amd64 \
      -o /usr/local/bin/aws-iam-authenticator && \
      chmod +x /usr/local/bin/aws-iam-authenticator


RUN curl -L https://get.helm.sh/${HELM_3_FILE} | tar xvz && \
      mv linux-amd64/helm /usr/bin/helm && \
      chmod +x /usr/bin/helm && \
      rm -rf linux-amd64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
