pipeline {
   agent any  
    stages {
        stage('Start') {
            steps {
                script {
                  env.GIT_COMMIT = sh (
                      script: 'git rev-parse HEAD',
                      returnStdout: true
                  ).trim()
                }
            }
        }
        stage('Build') {
            steps {
                sh "docker build --no-cache -f Dockerfile -t thoutam01/jenkins-slave ."
                sh "docker tag thoutam01/jenkins-slave gcr.io/thoutam01/jenkins-slave:latest"
                sh "docker tag thoutam01/jenkins-slave gcr.io/thoutam01/jenkins-slave:${env.GIT_COMMIT}"      
            }
        }
                stage('Push') {
            steps {
                withDockerRegistry(
                    registry: [ 
                    //create Jenkins-gcr credentials
                        credentialsId: 'gcr:jenkins-gcr',        
                        url: 'https://gcr.io/thoutam01'
                    ]
                ){
                sh "docker push gcr.io/thoutam01/jenkins-slave:${env.GIT_COMMIT}"
                sh "docker push gcr.io/thoutam01/jenkins-slave:latest"
                }
            }
        }        
     }
   }
