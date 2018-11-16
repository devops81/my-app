node {
	stage('SCM CHECKOUT') {
git (url: 'https://github.com/devops81/my-app.git')

}
stage ('MVN Package') {
	def mvnHome = tool name: 'MVN3', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	sh "${mvnCMD} clean package"
}
	
stage ('Build Dokcer Image') {

sh 'docker build -t devops81/my-app:2.0.0 .'
}

stage('Build Docker Image') {
sh 'docker login -u devops81 -p Qw32k12345'
sh 'docker push -t devops81/my-app:2.0.0'
}

stage('Run container on dev server')
{
sh 'docker run -p 7070:8080 -d -name my-app kammana/my-app:2.0.0'
}
}
