node {

stage('SCM CHECKOUT') 
  {
git (url: 'https://github.com/devops81/my-app.git', branch: 'DockerExample')
  }

stage('Compile the SourceCode')
{
def mvnHome = tool name: 'MVN3', type: 'maven'
def mvnCMD="${mvnHome}/bin/mvn"
sh "${mvnCMD} clean package"
}
stage('Build docker image')
{
sh 'docker build -t devops81/my-app:2.0.0'
}
}

