
pipeline { 
    agent any 
    stages {
        stage('Cloning Git') { 
            steps { 
                git 'https://github.com/Doc7210/project.git' 
            }
        } 
        stage('Building image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":latest" 
                }
            } 
        }
        stage('Deploy image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:latest" 
            }
        }
        stage('Updating Cluster Definition') { 
            steps { 
                sh '''
                app_name="test-app"
                cluster_name=`aws ecs list-clusters | grep $app_name | awk -F "/" '{ print $2 }' | sed 's/"//'`
                ecs_service_name=`aws ecs list-services --cluster $cluster_name | awk -F "/" '{ print $3 }' | sed 's/"//' | sed '/^$/d'`
                task_definition_name=`aws ecs list-task-definitions | grep $app_name | awk -F: '{ print $6 }' | awk -F "/" '{ print $2 }'`
                '''
            }
        }
    }
}