
node {
  
  def image
  def mvnHome = tool 'Maven'

  
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
        
    stage ('Docker Build') {
         // Build and push image with Jenkins' docker-plugin
        withDockerServer([uri: "unix:///var/run/docker.sock"]) {

            withDockerRegistry([credentialsId: "dockerhub", url: "https://index.docker.io/v1/"]) {
            image = docker.build("sherqodirov/mywebapp")
            image.push()
            }
        }
    }
    
    stage ("Terraform init") {
        steps {
            sh ('pwd && ls -lat && terraform init terraform') 
        }
    }

    stage ("Terraform plan") {
        steps {
            sh ('terraform plan terraform') 
        }
    }

    stage ('Terraform Deploy using Kubectl') {
          sh "terraform apply --auto-approve ./terraform"
    }
}