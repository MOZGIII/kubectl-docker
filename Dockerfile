FROM alpine:3.6

# Latest version may be found at https://kubernetes.io/docs/imported/release/notes/
ARG KUBECTL_VERSION=v1.10.0

RUN apk add --no-cache \
      ca-certificates \
      curl \
      bash \
  && curl -sSL \
      "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
      -o /usr/local/bin/kubectl\
  && chmod +x /usr/local/bin/kubectl \
  && kubectl version --client

CMD ["kubectl"]
