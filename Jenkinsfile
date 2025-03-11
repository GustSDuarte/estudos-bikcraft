pipeline {
  agent any

  stages{
    stage('Build image'){
      steps{
        script {
            dockerapp = docker.build ("gustavosduarte/bikcraft-teste:${env.BUILD_ID}", '-f Dockerfile .')
        }
      }
    }
  }
}