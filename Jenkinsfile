pipeline {
  agent any

  stages{
    stage('Build Image'){
      steps{
        script {
            dockerapp = docker.build ("gustavosduarte/bikcraft-teste:${env.BUILD_ID}", '-f Dockerfile .')
        }
      }
    }
    stage('Push Image'){
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
            dockerapp.push("${env.BUILD_ID}")
            }
        }
      }
    }
  }
}