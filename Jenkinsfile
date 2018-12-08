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
    step($class: 'Mailer', mail bcc: '', body: 'this is the body', cc: '', from: 'shweta.idk@gmail.com', replyTo: 'shweta.idk@gmail.com', 
              subject: 'This is a test', to: 'shweta.idk@gmail.com')
          
          }
          
  
    }
