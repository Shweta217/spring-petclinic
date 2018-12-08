#!groovy

pipeline{

  agent any
  def mvnHome
  
  stages
  { 
    stage('Preparation'){
      step{
        mvnHome = tool 'M2_HOME'
      }
      
    }

  stage('Install'){
    step{
      bat(/"${mvnHome}\bin\mvn" clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true/)
}
  }
    
    
      
    
  
  }
}
