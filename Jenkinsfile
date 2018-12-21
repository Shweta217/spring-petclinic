#!groovy

pipeline{
   agent none
    
      stages{
        stage('Install'){
                agent {
        docker {
          image 'maven:latest'
                
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
