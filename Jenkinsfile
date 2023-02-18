pipeline {
    environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
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
                sh "yc compute instance update-container fhm3mpu35att9nc5rkhd --container-image=doc7210/tms:$BUILD_ID"
            }
        }  
    }
        post {
            always {
              slackSend(color: "good", message: "Build deployed successfully")
            }
        }
}
