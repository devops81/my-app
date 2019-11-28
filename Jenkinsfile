node( 'master') {

stage('SCM CHECKOUT') 
  {
git (url: 'https://github.com/devops81/my-app.git', branch: 'DockerExample')
  }

stage('Compile the SourceCode')
{
def mvnHome = tool name: 'Maven3', type: 'maven'
def mvnCMD="${mvnHome}/bin/mvn"
  dir("/var/lib/jenkins/workspace/Pipeline-Example") {
    sh "${mvnCMD}  -Dmaven.test.skip=true clean install"
}
  

}

stage('Build docker image')
{

sh 'docker build -t devops81/demoapp:2.0.0 .'
}
stage('Docker Push Image') {
sh 'sudo docker login -u devops81 -p Listen@1234'
sh 'sudo docker push devops81/demoapp:2.0.0'
}
stage('Run container on the Dev server') {
sh 'sudo docker run -p 8081:8080 -d devops81/demoapp:2.0.0'
  
}
}


