#!groovy

pipeline
{
steps
{
agent any{

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
}
