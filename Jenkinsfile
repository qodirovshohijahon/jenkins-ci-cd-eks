
node {
  
  def image
//   def mvnHome = tool 'Maven'

    // environment {
    //     AWS_ACCESS_KEY_ID     =  "AKIAUEE33YYWZTRVBHLJ" //credentials('AWS_ACCESS_KEY_ID')
    //     AWS_SECRET_ACCESS_KEY = "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" // credentials('AWS_SECRET_ACCESS_KEY')
    //     AWS_DEFAULT_REGION = "us-east-1"
    //     // TF_IN_AUTOMATION      = '1'
    //     TF_VAR_host=credentials('host')
    //     TF_VAR_cluster_ca_certificate=credentials('cluster_ca_certificate')
    //     TF_VAR_cluster_name=credentials('cluster_name')
    // }
     
     stage ('checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[
                name: 'main']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [],
                submoduleCfg: [],
                userRemoteConfigs:[[
                    // credentialsId: 'githubcred',
                    url: 'https://github.com/qodirovshohijahon/jenkins-ci-cd-eks.git/'
                ]]
        ])
    }
    
    stage ('Build') {
            sh 'mvn -f pom.xml clean install'            
    }
        
    stage ('archive') {
            archiveArtifacts '**/*.jar'
    }
        
    // stage ('Docker Build') {
    //      // Build and push image with Jenkins' docker-plugin
    //     withDockerServer([uri: "unix:///var/run/docker.sock"]) {

    //         withDockerRegistry([credentialsId: "dockerhub", url: "https://index.docker.io/v1/"]) {
    //         image = docker.build("sherqodirov/mywebapp")
    //         image.push()
    //         }
    //     }
    // }
    
    stage ("Terraform init") {
        sh ('pwd && ls -lat && terraform -chdir="./terraform" init') 
    }

    stage ("Terraform plan") {
        sh ('terraform -chdir="./terraform" plan') 
    }

    stage ('Terraform Deploy using Kubectl') {
          sh 'terraform -chdir="./terraform" apply --auto-approve'
    }
}