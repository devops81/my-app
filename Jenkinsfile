node {
	
	stage('SCM Chekout')  { 

checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/devops81/my-app.git']]])

			      }

stage('Compile-Package') {

def mvnHome= tool name: 'MVN3', type: 'maven'

sh "{mvnHome}/bin/mvn package"
}

stage('email notification') {
emailext body: '$DEFAULT_CONTENT', subject: '$DEFAULT_SUBJECT', to: 'devops81@gmail.com'
}

stage('Slack Notification') {

slackSend baseUrl: 'https://hooks.slack.com/services/', channel: 'jenkinjobnotification', color: 'red', message: "started ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", teamDomain: 'devops81', tokenCredentialId: 'slack-not'

}

}

