pipeline {
    agent any

    stages {

        stage('Clone') {
          steps {
            git 'https://github.com/GustSDuarte/Estudos-bikcraft.git'
          }
        }

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
