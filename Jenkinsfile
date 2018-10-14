node{
   stage('SCM Checkout'){
     git 'https://github.com/devops81/my-app'
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'Maven3', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
   }
   stage('Email Notification'){
      mail bcc: '', body: '''Hi Welcome to jenkins email alerts
      Thanks
      Sanjeeb''', cc: '', from: '', replyTo: '', subject: 'Jenkins Job', to: 'devosp81@gmail.com'
   }
  
}
