node{
   stage('SCM Checkout'){
     git 'https://github.com/javahometech/my-app'
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'MVN3', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
   }
   stage('Email Notification'){
      mail bcc: '', body: '''Hi Welcome to jenkins email alerts
      Thanks
      Hari''', cc: '', from: '', replyTo: '', subject: 'Jenkins Job', to: 'devops81@gmail.com'
   }
   stage('Slack Notification'){
   slackSend baseUrl: 'https://hooks.slack.com/services/', channel: 'jnotification', 
      color: 'good', message: "started ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", 
      teamDomain: 'devops81', tokenCredentialId: 'slack-demo'

   }
}


