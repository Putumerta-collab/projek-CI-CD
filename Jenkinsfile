pipeline {
    agent any

   environment {
        DOCKERHUB_CREDENTIALS = credentials('PUJAREPO') // Gunakan ID kredensial yang telah Anda atur di Jenkins
        IMAGE_NAME = 'dpuja/test' // Ganti dengan nama image Docker Anda
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
                    docker.build('your-image-name')
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'PUJAREPO') {
                        docker.image('your-image-name').push('latest')
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
