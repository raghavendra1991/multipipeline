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
        
        stage ('Cleaning') {
            steps {
                echo 'Cleaning Local Images and Containers'
                sh 'docker stop $(docker ps -a -q) || true && docker rm $(docker ps -a -q) || true && docker rmi -f $(docker images  -a -q) || true'     
            }
        }
    }
}
