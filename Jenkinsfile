node {
	stage('SCM CHECKOUT') {
git (url: 'https://github.com/devops81/my-app.git')

}
stage ('MVN Package') {
	def mvnHome = tool name: 'Maven3', type: 'maven'
	def mvnCMD = "${mvnHome}/bin/mvn"
	sh "${mvnCMD} clean package"
}
	
stage ('Build Dokcer Image') {

sh 'docker build -t devops81/my-app:2.0.1 .'
}
	stage('Push Dokcer Image') {
		withCredentials([string(credentialsId: 'docker-credv', variable: 'dockerHubPwd')]) {
			sh "docker login -u devops81 -p ${dockerHubPwd}"
		}	
		sh 'docker push devops81/my-app:2.0.1'
	}
	stage('Run container on Dev Server') {
	def dockerRun='docker run -p 8080:8080 -d --name my-app devops81/my-app:2.0.1'
		sshagent(['dev-server']) {
			sh "ssh -o StrictHostKeyChecking=no centos@18.220.201.246 ${dockerRun}"
}
	}

}
