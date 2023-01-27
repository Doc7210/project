pipeline {
    agent any
     stages {
        stage('Clone') {
            steps {
                sh 'git clone https://github.com/Doc7210/project.git'
            }
        }    
        stage('Build') {
            steps {
                sh 'docker build . -t cr.yandex/crp3sq29v5vffjbqj8u6/demo:v1'
            }
        }
          stage('Deploy') {
                steps {
                    sh 'docker push cr.yandex/crp3sq29v5vffjbqj8u6/demo:v1'
                }
            }
    }
 }
