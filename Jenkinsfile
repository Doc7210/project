pipeline {
    agent any
    tools {
           terraform 'terraform'
     }
     stages {
        stage('Init') {
            steps {
                sh "terraform init"
            }
         }    
        stage('Apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
    }
}
