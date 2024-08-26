pipeline {
    agent any

   environment {
        DOCKERHUB_CREDENTIALS = credentials('PUJAREPO') // Gunakan ID kredensial yang telah Anda atur di Jenkins
        IMAGE_NAME = 'dpuja/testing' // Ganti dengan nama image Docker Anda
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
                    dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {
                        dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push("latest")
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
            echo 'Pipeline completed successfully and image pushed to Docker Hub!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
