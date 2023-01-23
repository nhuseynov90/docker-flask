pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/nhuseynov90/docker-flask.git'
            }
        }
        stage('test') {
            steps {
                sh 'ls -la'
                sh 'pwd'
            }
        }
        stage('building docker image') {
            steps {
                sh 'echo "Building docker image"'
                sh 'docker build . -t nhuseynov/flaskapp:0.2'
            }
        }
        stage('push image to dockerhub') {
            steps {
                withDockerRegistry(credentialsId: 'nhuseynov-dockerhub-cred', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push nhuseynov/flaskapp:0.2
                    '''
                }
            }
        }
        stage('deleting docker images after pushing to dockerhub') {
            steps {
                sh 'docker rmi nhuseynov/flaskapp:0.2'
            }
        }
    }
}
