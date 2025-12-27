pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend') {
            steps {
                sh 'docker build -t capstone-backend ./backend'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'docker build -t capstone-frontend ./frontend'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker run capstone-backend pytest || true'
            }
        }

        stage('Deploy Dev') {
            steps {
                sh './scripts/deploy.sh dev || true'
            }
        }

        stage('Deploy Prod') {
            steps {
                input message: 'Approve Production Deployment?'
                sh './scripts/deploy.sh prod || true'
            }
        }
    }
}

