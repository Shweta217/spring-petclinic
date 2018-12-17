#!groovy

pipeline{
   agent any
   environment {
        AWS_ACCESS_KEY_ID     = ''
        AWS_SECRET_ACCESS_KEY = ''
    }
  
      stages{
        stage('Install'){
              steps{
                println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
            }
        
  
  
  
  stage('aws chck') {
    steps {
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'kamasmida',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {       
           script{
                //container('aws') {
                   if(isUnix()){
                       sh 'env | sort -u'
                    sh 'aws ec2 describe-instances'
                   }
                   else{
                     //  bat('env | sort -u')
                     bat('aws ec2 describe-instances')
                   }
                   
             //   }
           }
 
    }
}
}
      }
  
  
  
  post { 
        
     
   failure {
          //  echo 'Failing'!'
      println 'Still failing'
          
    mail to: 'shweta.idk@gmail.com',
             subject: "Un-Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Need correction with ${env.BUILD_URL}"
        }
     
     success{
        println 'SUCCESS'
         mail to: 'mrcool435@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
     }
   
    
          }
          
  
    }
