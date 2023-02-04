source link - https://docs.aws.amazon.com/eks/latest/userguide/prometheus.html

### Deploying Prometheus
This topic helps you deploy Prometheus into your cluster with Helm V3. 
If you already have Helm installed, you can check your version with the `helm version` command.
Helm is a package manager for Kubernetes clusters. 
For more information about Helm and how to install it, see Using Helm with Amazon EKS.


### Using Helm with Amazon EKS
The Helm package manager for Kubernetes helps you install and manage applications on your Kubernetes cluster.
For more information, see the Helm documentation.
This topic helps you install and run the Helm binaries so that you can install and manage charts using the Helm CLI on your local system.

#### To install the Helm binaries on your local system
Run the appropriate command for your client operating system.

- If you're using macOS with Homebrew, install the binaries with the following command.
    `brew install helm`

- If you're using Windows with Chocolatey, install the binaries with the following command.
    `choco install kubernetes-helm`

- If you're using Linux, install the binaries with the following commands.
    ```shell
        curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
        chmod 700 get_helm.sh
        ./get_helm.sh
    ```

See the version of Helm that you installed.
- `helm version --short | cut -d + -f 1`


