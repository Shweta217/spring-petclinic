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
            echo 'I succeeeded!'
          
    mail to: 'shweta.idk@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
        }
   
    
          }
          
  
    }
