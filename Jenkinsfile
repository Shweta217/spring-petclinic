#!groovy

pipeline{
   agent any
   environment {
        AWS_ACCESS_KEY_ID     = 'AKIAJT2FYPGEUA3IMVKA'
        AWS_SECRET_ACCESS_KEY = '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'
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
          //  echo 'I succeeeded!'
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
