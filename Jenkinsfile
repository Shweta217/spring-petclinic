#!groovy

pipeline{

  agent any
  def mvnHome
  
  stages
  { 
    stage('Preparation'){
      steps{
        mvnHome = tool 'M2_HOME'
      }
      
    }

  stage('Install'){
    steps{
      bat(/"${mvnHome}\bin\mvn" clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true/)
}
  }
    
    
      
    
  
  }
}
