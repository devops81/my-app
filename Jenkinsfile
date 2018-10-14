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
     emailext body: 'Sending build status mail', subject: 'Build Status', to: 'devops81@gmail.com'
   }
  
}
