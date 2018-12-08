#!groovy

pipeline{
  agent any
      stages{ 
          stage('Install'){
              step{
                bat(mvn clean install -Dmaven.test.failure.ignore -Dmaven.test.skip=true)
                }
            }
        }
    }
