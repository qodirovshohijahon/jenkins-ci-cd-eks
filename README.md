# jenkins-ci-cd-eks

`eksctl create cluster --name demo-eks --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --managed`
`aws eks update-kubeconfig --region ap-northeast-1 --name jenkins-cluster`
Prerequests:
- Docker Hub Account
- 

Jenkins Plugins

- Docker Pipeline
- Docker Plugin
- Kubernetes



Configure Secrets
Manage Jenkins -> Credentials -> System -> Global credentials (unrestricted)

- Docker Hub Username & Password