node{
   stage('SCM Checkout'){
     checkout([$class: 'GitSCM', branches: [[name: '*/feature-1']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/devops81/my-app.git']]])
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'Maven3', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
   }
   stage('Email Notification'){
      emailext body: 'Please go to ${BUILD_URL} and verify the build', subject: 'Job \'${JOB_NAME}\' (${BUILD_NUMBER})', to: 'devops81@gmail.com'
   }
  
}
