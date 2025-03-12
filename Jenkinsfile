pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'gustavosduarte/bikcraft-teste'
    BUILD_ID = "${BUILD_ID}"
  }

  when {
    branch 'main'  // Só executa a etapa se o push for para a branch 'main'
  }

  stages{
    stage('Build Image'){
      steps{
        script {
            dockerapp = docker.build ("${DOCKER_IMAGE}:${BUILD_ID}", '-f Dockerfile .')
        }
      }
    }
    stage('Push Image'){
        steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
            dockerapp.push("${BUILD_ID}")
            }
        }
      }
    }
    stage('Deploy Container') {
        steps{
          script {
            sh "docker-compose stop bikcraft-teste"
            sh "docker-compose build --no-cache bikcraft-teste"
            sh "docker-compose up -d bikcraft-teste"
          }
      }
    }
  }
}