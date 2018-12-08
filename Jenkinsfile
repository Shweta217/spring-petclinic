#!groovy

pipeline{
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
