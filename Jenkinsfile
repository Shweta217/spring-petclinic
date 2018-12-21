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
            credentialsId: 'ecr-ecs-Cred',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]])
              script{
                 println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
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
		

	
	post { 
                failure{
                println "still facing"
                }
     
   
     success{
        println 'SUCCESS'
         mail to: 'shweta.idk@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Everything is correct with ${env.BUILD_URL}"
     }
	 }
	 
	 
	 
	 }
