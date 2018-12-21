#!groovy

pipeline{
   agent any
    
      stages{
        stage('Install'){
                agent {
        docker {
          image 'maven:3.5.4-jdk-8-alpine'
        }
      }
             steps{
               
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
            }
        
stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t Shweta217/spring-petclinic:latest .'
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
