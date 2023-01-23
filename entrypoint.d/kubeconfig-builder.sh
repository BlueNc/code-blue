#!/bin/sh

if [ -d "/var/run/secrets/kubernetes.io/serviceaccount/" ]; then
  # Inspired from https://stackoverflow.com/a/68284850/9604920
  server=https://kubernetes.default.svc

  ca=$(< /var/run/secrets/kubernetes.io/serviceaccount/ca.crt base64 -w0)
  token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

  echo "
  apiVersion: v1
  kind: Config
  clusters:
    - name: default
      cluster:
        certificate-authority-data: ${ca}
        server: ${server}
  contexts:
    - name: default
      context:
        cluster: default
        namespace: default
        user: code-server
  users:
    - name: code-server
      user:
        token: ${token}
  current-context: default
  " > ~/.kube/config
fi
