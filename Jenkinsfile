pipeline {
    environment {
      registry = "cr.yandex/crpu9n65ua7j6t1vvn09/demo"
      registryCredential = "yc"
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
                script {
                  dockerImage = docker.build registry + ":v1"
                }
               
            }
        }
        stage('Deploy Image') {
            steps{
              script {
                docker.withRegistry( '', registryCredential ) {
                  dockerImage.push()
                }
              }
            }
        }
    }
 }
