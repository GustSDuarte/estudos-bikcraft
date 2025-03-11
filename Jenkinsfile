pipeline {
  agent any

  stages {
    stage('Teste') {
        steps {
          sh 'apt update'
          sh 'apt install -y docker.io'
          sh 'docker --version'
      }
    }
  }
}

