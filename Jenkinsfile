#!groovy

pipeline{
   agent any
    
      stages{
        stage('Install'){
              steps{
                println AWS_ACCESS_KEY_ID
                 println AWS_SECRET_ACCESS_KEY
                bat('mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true')
                }
            }
        
stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t sanjeev435/spring-petclinic:latest .'
      }
    }
	
	
	stage('Docker Push') {
      agent any
      steps {
              
              stage 'Publish containers'
    shouldPublish = input message: 'Publish Containers?', parameters: [[$class: 'ChoiceParameterDefinition', choices: 'yes\nno', description: '', name: 'Deploy']]
    if(shouldPublish == "yes") {
     echo "Publishing docker containers"
     sh "\$(aws ecr get-login)"
	sh "docker tag spring-petclinic:latest 758048112949.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic:latest"
        sh "docker push 758048112949.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic:latest"
 
        }
		}
        }}
		
		
		
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
