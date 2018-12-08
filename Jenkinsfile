#!groovy

pipeline{
  
  agent none
  
  stages
  { 
    def mvnHome
  mvnHome = tool 'M2_HOME'
  stage('Install'){
    agent any
    steps{
      bat(/"${mvnHome}\bin\mvn" clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true/)
}
  }
    
    
      
    
  
  }
}
