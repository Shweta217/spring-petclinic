#!groovy

pipeline{

//node{
//checkout scm
       // agent any
        //}

        agent { label 'Test_Node11' }
    
      stages{
              
         //     stage ('Deploy app release'){
//writeFile file: 'extras.json', text: "{'image_tag': '${IMAGE_TAG}', 'ecs_tasks': [${TASKS}]}"
//sh 'ansible-playbook site.yml -e "@extras.json"'
                      //new and working
    //    steps{ sh 'ansible-playbook  ~/Documents/sampleAnsible/site.yml ' }
           
//}
              
        stage('Maven Install and clone Gitrepo'){
         
              
                        
        
              
      
	  steps{
                sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'
          }   
      }
        
		
		stage('Docker Build') {
                     
      steps {
        sh 'docker build -t shweta217/spring-petclinic:latest .'
      }
    }
			

	stage('Docker Push') {
               // agent { label 'Test_Node11' }
      steps {
        withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_GLOBAL', passwordVariable: 'dockerHubPassword',
                                          usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push shweta217/spring-petclinic'
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
