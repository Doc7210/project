pipeline {
    agent any
    tools {
           terraform 'terraform'
     }
     stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/Doc7210/project.git', branch: 'main'
            }
        }    
        stage('Chown') {
            steps {
                sh "chmod 777 /var/lib/jenkins/workspace"
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
