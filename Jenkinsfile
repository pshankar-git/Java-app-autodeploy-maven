pipeline {
    agent any
    
    stages {

        stage('SCM Checkout') {
            steps {
                git url: 'https://github.com/pshankar-git/Java-app-autodeploy-maven.git'
            }
        }

        stage('Compile Stage') {
            steps {
                withMaven(maven : 'maven 3.6.0') {
                    sh 'mvn clean compile'
                }
            }
        }


        stage('Test Stage') {
            steps {
                withMaven(maven : 'maven 3.6.0') {
                    sh 'mvn test'
                }
            }
        }


        stage('Create the Build artifacts Stage (Package)') {
            steps {
                withMaven(maven : 'maven 3.6.0') {
                    sh 'mvn package'
                }
            }
        }

/*      stage('Deployment Stage - Tomcat Container') {
            steps {
                deploy adapters: [tomcat8(credentialsId: 'f5c26087-bdee-4306-967a-6ae8eeec19d0', path: '', url: 'http://3.83.255.30:8080')], contextPath: 'mvn-hello-world', war: 'target/*.war'
            }
        }  */
        /*
        stage ('Creating AWS S3 Bucket for storing Terraform State') {
            steps {
                sh 'aws s3api create-bucket --bucket bucket-tf-state-49473 --region us-east-1'
                    
                }              
        } */

        stage ('Terraform Setup') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform_0.12.6', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
                    
                }              
            sh 'terraform --version'                    
                
            }
        }
        stage ('Terraform Init and Plan') {
            steps {
                sh 'terraform init $WORKSPACE'
                sh 'terraform plan'
            }
        }

        stage ('Terraform Apply') {
            steps {
                sh 'terraform apply --auto-approve'               
            }
        }

    }

}
