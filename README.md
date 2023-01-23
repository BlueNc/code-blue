# code-blue

Customization of https://hub.docker.com/r/codercom/code-server image for personnal usage.

## Installed tools
* kubectl
* helm
* argocd-cli
* kubeseal-cli
* buildctl

## Environment Variables
- `EXTENSIONS`: list of extensions to install at start (separated by space)

    Example
    ```
    -e EXTENSIONS="ms-kubernetes-tools.vscode-kubernetes-tools EditorConfig.EditorConfig"
    ```

- `UPDATE_CA`: update ca certificates on start (default false)

    Certificats location  `/usr/local/share/ca-certificates/`