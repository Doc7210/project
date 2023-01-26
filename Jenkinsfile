pipeline {
    agent any
     stages {
        stage('Build') {
            steps {
                sh 'docker build . -t cr.yandex/crp3sq29v5vffjbqj8u6/dem'
            }
        }     
         stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker push cr.yandex/crp3sq29v5vffjbqj8u6/dem'
            }
    }
     post {
        failure {
            echo 'build is broken'
        }
    }
}