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
                sh 'sudo docker build . -t cr.yandex/crpu9n65ua7j6t1vvn09/demo:v1'
            }
        }
          stage('Deploy') {
                steps {
                    sh 'sudo docker push cr.yandex/crpu9n65ua7j6t1vvn09/demo:v1'
                }
            }
    }
 }
