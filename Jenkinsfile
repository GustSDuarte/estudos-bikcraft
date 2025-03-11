pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
          git credentialsId:'teste_github', url: 'https://github.com/GustSDuarte/Estudos-bikcraft.git'
      }
    }

    stage('Verificar Repositório') {
      steps {
        sh 'git status'
        }
      }
    stage('Teste') {
        steps {
          sh 'docker --version'
      }
    }
  }
}

