node{
   stage('SCM Checkout'){
     git 'https://github.com/devops81/my-app.git'
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'Maven3', type: 'maven'   

      sh "${mvnHome}/bin/mvn clean install"
   }
   stage('SonarQube Analysis') {
      def mvnHome =  tool name: 'Maven3', type: 'maven'
      withSonarQubeEnv('sonarqube') {
         sh "${mvnHome}/bin/mvn sonar:sonar"
      }
   }
  stage("Quality Gate Statuc Check"){
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                   slackSend baseUrl: 'https://hooks.slack.com/services/',
                   channel: '#jenkinsnotification',
                   color: 'danger', 
                   message: 'SonarQube Analysis Failed', 
                   teamDomain: 'devops81',
                   tokenCredentialId: 'slack-demo'
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
      }   
   stage('Email Notification'){
     emailext body: 'Sending build status mail', subject: 'Build Status', to: 'devops81@gmail.com'
   }
   stage ('slack Notification') {
slackSend baseUrl: 'https://hooks.slack.com/services/', channel: '#jenkinsnotification', color: 'good', message: 'Welcome to Jenkins , Slack', teamDomain: 'devops81', tokenCredentialId: 'slack-demo'
   }      
  
}
