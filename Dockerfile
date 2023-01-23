FROM argoproj/argocd:v2.5.6 as argocd

FROM bitnami/sealed-secrets-kubeseal:v0.19.3 as kubeseal

FROM moby/buildkit:v0.11.0-rootless as buildkit

FROM codercom/code-server:4.9.1

ENV HELM_VERSION=v3.10.3

RUN sudo curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && sudo chmod +x /usr/local/bin/kubectl \
 && curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && sudo mv linux-amd64/helm /bin/helm && rm -rf linux-amd64

COPY --from=argocd /usr/local/bin/argocd /usr/local/bin/argocd

COPY --from=kubeseal /usr/local/bin/kubeseal /usr/local/bin/kubeseal

COPY --from=buildkit /usr/bin/buildctl /usr/local/bin/buildctl

COPY ./entrypoint.d /entrypoint.d
