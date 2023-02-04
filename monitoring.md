source link - https://docs.aws.amazon.com/eks/latest/userguide/prometheus.html

### Deploying Prometheus
This topic helps you deploy Prometheus into your cluster with Helm V3. 
If you already have Helm installed, you can check your version with the `helm version` command.
Helm is a package manager for Kubernetes clusters. 
For more information about Helm and how to install it, see Using Helm with Amazon EKS.

### To deploy Prometheus using Helm
- Create a Prometheus namespace.
  - `kubectl create namespace prometheus`
- Add the prometheus-community chart repository.
  - `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
- Deploy Prometheus.
  - `helm upgrade -i prometheus prometheus-community/prometheus \ --namespace prometheus \ --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"`
- Verify that all of the pods in the prometheus namespace are in the READY state.
  - `kubectl get pods -n prometheus`
- Use kubectl to port forward the Prometheus console to your local machine.
  - `kubectl --namespace=prometheus port-forward deploy/prometheus-server 9090`
- Point a web browser to `localhost:9090` to view the Prometheus console.
- Choose a metric from the - **insert metric at cursor** menu, then choose **Execute**. Choose the **Graph** tab to show the metric over time. The following image shows `container_memory_usage_bytes` over time.



----------------------



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


