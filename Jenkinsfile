pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
          git credentialsid:'github_credentials' url: 'https://github.com/GustSDuarte/Estudos-bikcraft.git'
      }
    }

    stage('Verificar Repositório') {
      steps {
      // Verificar se o repositório foi clonado corretamente
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

