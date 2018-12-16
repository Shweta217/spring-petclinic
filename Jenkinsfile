#!groovy

pipeline{
   agent any
   environment {
        AWS_ACCESS_KEY_ID     = credentials('AKIAJT2FYPGEUA3IMVKA')
        AWS_SECRET_ACCESS_KEY = credentials('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')
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
            accessKeyVariable: AWS_ACCESS_KEY_ID,
            secretKeyVariable: AWS_SECRET_ACCESS_KEY
        ]]) {             
                container('aws') {
                    sh 'env | sort -u'
                    sh 'aws ec2 describe-instances'
                }
 
    }
}
}
      }
  
  
  
  post { 
        
     
   success {
            echo 'I succeeeded!'
          
    mail to: 'shweta.idk@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
        }
     
     failure{
        println 'SUCCESS'
         mail to: 'mrcool435@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
     }
   
    
          }
          
  
    }
