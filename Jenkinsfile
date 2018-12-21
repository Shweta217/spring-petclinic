#!groovy

pipeline{
   agent any
    
      stages{
        stage('Maven Install and clone Gitrepo'){
         
          steps{
               
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }   
            }
        

	stage('Docker Push') {
      agent any
      steps {
    withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'ecr-test',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]])
		
     println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
        }
		}
        }
		




	
	
		
		
	post { 
        
     
   
     success{
        println 'SUCCESS'
         mail to: 'shweta.idk@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
     }
	 }
	 
	 
	 
	 }
