pipeline {
    environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
    IMAGE_TAG="$BUILD_ID"
  }
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
        stage('Build') {
            steps {
                sh 'docker build . -t doc7210/tms:$BUILD_ID'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
             }
        }
        stage('Deploy') {
            steps {
                sh 'docker push doc7210/tms:$BUILD_ID'
            }
        } 
        stage('Init') {
            steps {
                sh "terraform init"
            }
         }    
        stage('Apply') {
            steps {
                sh "{echo $IMAGE_TAG}
                sh "terraform apply -auto-approve"
            }
        }
    }
}
