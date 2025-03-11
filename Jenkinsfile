pipeline {
  agent any

  stages {
    stage('Teste') {
        steps {
          sh 'apt update'
          sh 'apt install docker.io'
          sh 'docker --version'
      }
    }
  }
}

