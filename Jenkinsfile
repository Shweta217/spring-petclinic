#!groovy

pipeline{
   agent any
    
      stages{
        stage('Install'){
              steps{
               
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
            }
        

	
	
	stage('Docker Push') {
      agent any
      steps {
    withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'shweta.idk@gmail.com',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]])
		
     println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
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
         mail to: 'shweta.idk@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
     }
	 }
	 
	 
	 
	 }
