node( 'master') {

stage('SCM CHECKOUT') 
  {
git (url: 'https://github.com/devops81/DevOps-Demo.git', branch: 'Development')
  }

stage('Compile the SourceCode')
{
def mvnHome = tool name: 'MVN3', type: 'maven'
def mvnCMD="${mvnHome}/bin/mvn"
  dir("/var/lib/jenkins/workspace/Pipeline-Example/examples/feed-combiner-java8-webapp") {
    sh "${mvnCMD}  -Dmaven.test.skip=true clean install"
}
  

}

stage('Build docker image')
{

sh 'sudo  docker build -t devops81/demoapp:2.0.0 .'
}
stage('Docker Push Image') {
sh 'sudo docker login -u devops81 -p Qw32k12345'
sh 'sudo docker push devops81/demoapp:2.0.0'
}
stage('Run container on the Dev server') {
sh 'sudo docker run -p 8080:8080 -d devops81/demoapp:2.0.0'
  
}
}


