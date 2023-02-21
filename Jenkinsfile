pipeline {
    environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
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
        stage('Update') {
            steps {
                sh "yc compute instance update-container fhmrf0pae4v6sv3ius9t --container-image=doc7210/tms:$BUILD_ID"
            }
        }  
    }
        post {
            success {
              slackSend(color: "good", message: "Build deployed successfully")
             }
            failure {
              slackSend(color: "good", message: "Build Deployment Error")
             }
        }
}
