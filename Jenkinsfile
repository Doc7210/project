pipeline {
    environment {
    registry = "cr.yandex/crp3sq29v5vffjbqj8u6/demo"
    registryCredential = ‘yc’
}
    agent any
     stages {
        stage('Clone') {
            steps {
                sh 'git clone https://github.com/Doc7210/project.git'
            }
        }    
        stage('Build') {
            steps {
                sh 'docker build . -t cr.yandex/crpu9n65ua7j6t1vvn09/demo:v1'
            }
        }
          stage('Deploy') {
                steps {
                    sh 'docker push cr.yandex/crpu9n65ua7j6t1vvn09/demo:v1'
                }
            }
    }
 }
