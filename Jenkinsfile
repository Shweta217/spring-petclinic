#!groovy

pipeline{
   agent none
    
      stages{
        stage('Maven Install and clone Gitrepo'){
          agent {
        docker {
          image 'maven:3.5.4-jdk-8-alpine'
                
        }
      }
	  steps{
               
                sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'
                }   
            }
        
		
		stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t shweta217/spring-petclinic:latest .'
      }
    }
			

	stage('Docker Push') {
      agent any
      steps {
    withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'ecr-ecsCred',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]){
              script{
                 println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
				 sh 'docker tag shweta217/spring-petclinic 758048112949.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic'
                 sh 'docker push 758048112949.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic'
                //container('aws') {
                   if(isUnix()){
                       sh 'env | sort -u'
                    sh 'aws ec2 describe-instances'
                   }
                   else{
                           withAWS(region:'us-east-1') {
                     //  bat('env | sort -u')
                                   bat('aws ec2 describe-instances')}
                   }
                   
             //   }
           }
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
