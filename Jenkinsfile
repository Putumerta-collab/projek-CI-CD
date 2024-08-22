pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('id') // Ganti dengan ID kredensial yang benar
        DOCKER_IMAGE = 'pmerta22/testingjenkinsweb:tag'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Putumerta-collab/projek-CI-CD.git', branch: 'main'
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
