pipeline {
    agent any
    stages {
        stage('Build Frontend') {
            steps {
                dir('src-app') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Using the Dockerfile in the root to build the app
                sh 'docker build -t grocery-app:latest .'
            }
        }
    }
}
