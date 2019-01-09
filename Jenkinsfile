#!groovy

pipeline{

//node{
//checkout scm
       // agent any
        //}

        agent { label 'Test_Node11' }
    
      stages{
              
              stage ('Deploy app release')
{
//writeFile file: 'extras.json', text: "{'image_tag': '${IMAGE_TAG}', 'ecs_tasks': [${TASKS}]}"

//sh 'ansible-playbook site.yml -e "@extras.json"'
        steps{ ansiblePlaybook('site.yml') }
                //sh 'ansible-playbook "~/Documents/sampleAnsible/site.yml" ' }
}
              
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
        withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_GLOBAL', passwordVariable: 'dockerHubPassword',
                                          usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push sanjeev435/spring-petclinic'
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
