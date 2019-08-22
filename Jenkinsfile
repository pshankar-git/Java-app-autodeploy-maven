pipeline {
    agent any
    stages{
        stage('SCP Checkout')
        {
            steps{
                echo " checking out from giit"
                git url: 'https://github.com/pshankar-git/Java-app-autodeploy-maven/'
            }
        }
        
        stage('Maven Compile')
        {
            steps{
                withMaven(maven: 'maven 3.6.0') {
                sh 'mvn compile'
            }
        }
        }
        stage('Maven Test')
        {
            steps{
                withMaven(maven: 'maven 3.6.0') {
                sh 'mvn test'
            }
        }
        }
        
        stage('Maven Package')
        {
            steps{
                
            deploy adapters: [tomcat8(credentialsId: 'd102adea-ab43-4cd3-a1b8-2dc484b7abb3', path: '', url: 'http://13.127.91.64:9090/')], contextPath: 'sparkjava-hello-world-1.0', war: 'target/sparkjava-hello-world-1.0.war'
        }
        }
    }
}
