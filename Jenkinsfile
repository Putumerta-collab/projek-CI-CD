pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('PUJAREPO') // Gunakan ID kredensial yang telah Anda atur di Jenkins
        IMAGE_NAME = 'dpuja/test' // Ganti dengan nama image Docker Anda
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code dari repository GitHub
                git url: 'https://github.com/Putumerta-collab/projek-CI-CD.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
    }

    post {
        always {
            // Cleanup Docker images
            sh 'docker rmi $IMAGE_NAME || true'
        }
    }
}
