pipeline {
    agent any
     stages {
        stage('Clone') {
            steps {
                sh "git clone https://github.com/Doc7210/project.git"
            }
        }    
        stage('Build') {
            steps {
                sh 'docker build . -t doc7210/tms:v1'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker push doc7210/tms:v1'
            }
        }
    }
 }
