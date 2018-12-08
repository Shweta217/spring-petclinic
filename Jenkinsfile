#!groovy

pipeline{
  
  def mvnHome = tool 'M2_HOME'
  agent none
  
  stages
  { 
    
  stage('Install'){
    agent any
    steps{
      bat(/"${mvnHome}\bin\mvn" clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true/)
}
  }
    
    
      
    
  
  }
}
