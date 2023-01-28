
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
                    credentialsId: 'githubcred',
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
    
    stage ('Kubernetes Deploy') {
        kubernetesDeploy(
                configs: 'springboot-docker-hub.yaml',
                kubeconfigId: 'jenkins-eks-config',
                enableConfigSubstitution: true
            )
    }

    // stage ('Kubernetes Deploy using Kubectl') {
    //       sh "kubectl apply -f springBootDeploy.yml"
    // }
}