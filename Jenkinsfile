pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'gustavosduarte/bikcraft-teste'
    BUILD_ID = "${BUILD_ID}"
  }

  stages{
    stage('Build Image'){
      when {
                branch 'main'  // Só executa a etapa se o push for para a branch 'main'
            }
      steps{
        script {
            dockerapp = docker.build ("${DOCKER_IMAGE}:${BUILD_ID}", '-f Dockerfile .')
        }
      }
    }
    stage('Push Image'){
      when {
                branch 'main'  // Só executa a etapa se o push for para a branch 'main'
            }
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
            dockerapp.push("${BUILD_ID}")
            }
        }
      }
    }
    stage('Deploy Container') {
      when {
                branch 'main'  // Só executa a etapa se o push for para a branch 'main'
            }
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