pipeline {
    agent any
    tools {
           terraform 'terraform'
     }
     stages {
        stage('Clone') {
            steps {
                sh "git clone https://github.com/Doc7210/project.git"
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }  
        stage('Init') {
            steps {
                sh "terraform init"
            }
         }    
        stage('Apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
    }
}
