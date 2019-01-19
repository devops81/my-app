node {

stage('SCM CHECKOUT') 
  {
git (url: 'https://devops81@bitbucket.org/devops81/demorepo.git', branch: 'Demo_Branch')
  }

stage('Compile the SourceCode')
{
def mvnHome = tool name: 'MVN3', type: 'maven'
def mvnCMD="${mvnHome}/bin/mvn"
  dir("/var/lib/jenkins/workspace/FOLDER3/docker-app/examples/feed-combiner-java8-webapp") {
    sh "${mvnCMD}  -Dmaven.test.skip=true clean install"
}
  

}
  stage('SonarQub Analysis') {

def mvnHome = tool name: 'MVN3', type: 'maven'

withSonarQubeEnv('SONARQUBESERVER') {
 dir("/var/lib/jenkins/workspace/FOLDER3/docker-app/examples/feed-combiner-java8-webapp") {
sh "${mvnHome}/bin/mvn clean verify sonar:sonar"
 }
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
sh 'sudo docker run -p 7070:8080 -d devops81/demoapp:2.0.0'
  
}
}


