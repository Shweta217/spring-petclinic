#!groovy

pipeline{
   agent none
    
      stages{
        stage('Install'){
                agent {
        docker {
          
                steps{
               
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
        }
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
