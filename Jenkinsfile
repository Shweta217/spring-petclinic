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
