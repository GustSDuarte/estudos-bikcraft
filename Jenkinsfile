pipeline {
    agent any

    stages {
        stage('Test Docker') {
            steps {
                script {
                    // Testando o comando Docker
                    sh 'docker --version'
                    sh 'docker ps'
                }
            }
        }
    }
}
