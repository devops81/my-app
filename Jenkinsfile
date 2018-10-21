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

sh 'docker build -t devops81/my-app:2.0.0 .'
}

}
