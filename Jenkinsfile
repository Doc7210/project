pipeline {
    environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
  }
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

        stage('Login') {
                steps {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
        }
        stage('Deploy') {
            steps {
                sh 'docker push doc7210/tms:v1'
            }
        }
    }
 }
