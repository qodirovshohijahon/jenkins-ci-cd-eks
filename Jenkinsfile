
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
        
    // stage ('Docker Build') {
    //      // Build and push image with Jenkins' docker-plugin
    //     withDockerServer([uri: "tcp://localhost:4243"]) {

    //         withDockerRegistry([credentialsId: "fa32f95a-2d3e-4c7b-8f34-11bcc0191d70", url: "https://index.docker.io/v1/"]) {
    //         image = docker.build("ananthkannan/mywebapp", "MyAwesomeApp")
    //         image.push()
            
    //         }
    //     }
    // }
    
    //    stage('docker stop container') {
    //         sh 'docker ps -f name=myContainer -q | xargs --no-run-if-empty docker container stop'
    //         sh 'docker container ls -a -fname=myContainer -q | xargs -r docker container rm'

    //    }

    // stage ('Docker run') {

    //     image.run("-p 8085:8085 --rm --name myContainer")

    // }
}