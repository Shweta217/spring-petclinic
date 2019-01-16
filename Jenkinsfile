#!/usr/bin/groovy


pipeline{

     // agent { label 'Test_Node11' }
	  //agent any
    agent { label 'ecsSlave' }
      stages{
      /*        
       stage ('Deploy app release'){
                    //writeFile file: 'extras.json', text: "{'image_tag': '${IMAGE_TAG}', 'ecs_tasks': [${TASKS}]}"
                    //sh 'ansible-playbook site.yml -e "@extras.json"'
                    //new and working
                    steps{ 
                         //sh 'ansible-playbook  '/home/shweta/Documents/sampleAnsible/site.yml' ' 
                         // sh "ansible-playbook -e credentialsId: 'sshCred' '/home/shweta/Documents/sampleAnsible/site.yml' "
                            ansiblePlaybook(
                            
                            //credentialsId: 'sshCred',
                                    playbook: '/home/shweta/Documents/sampleAnsible/site.yml'
                            
                            )
                            
                       }
         }  */
              //agent { label 'ecsSlave' }
        
         stage('Maven Install and clone Gitrepo'){
              // input{message "Press Ok to continue"}
                // agent {label 'ecsSlave' }
                   steps{
                      parallel (
                           "unit tests 1 ": { sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'},
						   "unit tests 2 ": { sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'},
						   "unit tests 3 ": { sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'},
						   "unit tests 4 ": { sh 'mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true'}
                       )
                    }   
              }
        
         stage('Docker Build') {  
               // agent {label 'ecsSlave' }
             steps {
			  parallel (
                     "Docker Build 1 ": { sh 'docker build -t sanjeev435/spring-petclinic:latest .'}, 
					 "Docker Build 2 ": { sh 'docker build -t sanjeev435/spring-petclinic:latest .'}
                   )
                }
           }
	/*		
         stage('Docker Push') {
               agent {label 'ecsSlave' }
             steps {
                     withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_GLOBAL', passwordVariable: 'dockerHubPassword',
					 usernameVariable: 'dockerHubUser')]) {
                     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                     sh 'docker push sanjeev435/spring-petclinic'}
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
     }  */
  }
}
