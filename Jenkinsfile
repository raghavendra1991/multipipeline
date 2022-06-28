// Declarative pipeline
pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "raghaduvva/flaskapp"
        DOCKERHUB_CREDENTIALS = credentials('docker-hub')
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }

    stages {

        /* We do not need a stage for checkout here since it is done by default when using "Pipeline script from SCM" option. */
        
        stage ('Build Docker Image') {
            steps {
                echo 'Building Docker Image'
                sh 'docker build -t $DOCKER_HUB_REPO:$BUILD_NUMBER .'       
            }
        }

        stage ('Push Image ') {
            steps {
                echo 'Pushing Image'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR  --password-stdin'
                sh 'docker push $DOCKER_HUB_REPO:$BUILD_NUMBER'
            }
        }
        stage ('Delete Docker Image') {
            steps {
                echo 'Deleting Docker Image'
                sh 'docker rmi $DOCKER_HUB_REPO:$BUILD_NUMBER'
            }
        }
    }
}
