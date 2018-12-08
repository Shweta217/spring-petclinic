#!groovy

pipeline{
  agent none{
  
  stages
  { 
    
  stage('Install'){
    steps{
sh 'mvn clean install -Dmaven.test.skip=true'
}
  }
    
    
    stage('Build'){
  steps{
sh 'mvn -B'
  }
}
    
  }
  }
}

