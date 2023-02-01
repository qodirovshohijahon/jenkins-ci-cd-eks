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


### Create an IAM User with Admin Permissions
Navigate to IAM > Users.
Click Add user.
Set the following values:
User name: k8-admin
Access type: Programmatic access
Click Next: Permissions.
Select Attach existing policies directly.
Select AdministratorAccess.
Click Next: Tags > Next: Review.
Click Create user.
Copy the access key ID and secret access key, and paste them into a text file, as we'll need them in the next step


### Launch an EC2 Instance and Configure the Command Line Tools
Navigate to EC2 > Instances.

Click Launch Instance.

On the AMI page, select the Amazon Linux 2 AMI.

Leave t2.micro selected, and click Next: Configure Instance Details.

On the Configure Instance Details page:

Network: Leave default
Subnet: Leave default
Auto-assign Public IP: Enable
Click Next: Add Storage > Next: Add Tags > Next: Configure Security Group.

Click Review and Launch, and then Launch.

In the key pair dialog, select Create a new key pair.

Give it a Key pair name of "mynvkp".

Click Download Key Pair, and then Launch Instances.

Click View Instances, and give it a few minutes to enter the running state.

Once the instance is fully created, check the checkbox next to it and click Connect at the top of the window.

In the Connect to your instance dialog, select EC2 Instance Connect (browser-based SSH connection).

Click Connect.

In the command line window, check the AWS CLI version:
aws --version
It should be an older version.

Download v2:

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
Unzip the file:

unzip awscliv2.zip
See where the current AWS CLI is installed:

which aws
It should be /usr/bin/aws.

Update it:

sudo ./aws/install --bin-dir /usr/bin --install-dir /usr/bin/aws-cli --update
Check the version of AWS CLI:

aws --version
It should now be updated.

Configure the CLI:

aws configure
For AWS Access Key ID, paste in the access key ID you copied earlier.

For AWS Secret Access Key, paste in the secret access key you copied earlier.

For Default region name, enter us-east-1.

For Default output format, enter json.

Download kubectl:

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
Apply execute permissions to the binary:

chmod +x ./kubectl
Copy the binary to a directory in your path:

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
Ensure kubectl is installed:

kubectl version --short --client
Download eksctl:

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
Move the extracted binary to /usr/bin:

sudo mv /tmp/eksctl /usr/bin
Get the version of eksctl:

eksctl version
See the options with eksctl:

eksctl help

### Provision an EKS Cluster
Provision an EKS cluster with three worker nodes in us-east-1:

`eksctl create cluster --name dev --region us-east-1 --nodegroup-name standard-workers --node-type t3.medium --nodes 3 --nodes-min 1 --nodes-max 4 --managed`