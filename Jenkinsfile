#!groovy

pipeline{
  agent any
      stages{ 
          stage('Install'){
              steps{
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
            }
        }
  
  post {
        always {
            echo 'I will always say Hello again!'        
             emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
              recipientProviders: "shweta.idk@gmail.com",
               
               subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
 
              
          
           
          
         
 
        }
    }
  
    }
