pipeline {
    agent any
     stages {
        strage('Clone') {
            steps {
                git url: 'https://github.com/Doc7210/project.git', branch: 'main'
            }
        }    
        stage('Build') {
            steps {
                sh 'docker build . -t cr.yandex/crp3sq29v5vffjbqj8u6/demo:demo:v1'
            }
        }     
         stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker push cr.yandex/crp3sq29v5vffjbqj8u6/demo:v1'
            }
    }
     post {
        failure {
            echo 'build is broken'
        }
    }
}
