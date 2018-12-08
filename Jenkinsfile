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
            always
    echo 'I will always say Hello again!'
    step([$class: 'Mailer',
            notifyEverySuccessBuild: true,
            recipients: "shweta.idk@gmail.com",
            sendToIndividuals: true])
          
          }
          
  
    }
