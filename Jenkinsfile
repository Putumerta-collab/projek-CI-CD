pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') // Ganti dengan ID kredensial Docker Hub Anda di Jenkins
        DOCKER_IMAGE = 'pmerta22/testingjenkinsweb:tag' // Ganti dengan username dan nama repository di Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Putumerta-collab/projek-CI-CD.git', branch: 'main' // Ganti dengan URL repo GitHub Anda
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDENTIALS}") {
                        docker.image("${env.DOCKER_IMAGE}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
