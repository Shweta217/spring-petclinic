#!groovy

pipeline{
agent none
  steps{
    step('Install')
{
sh 'mvn clean install -Dmaven.test.skip=true'
}
    step('Build')
{
sh 'mvn -B'
}
    
}
}
