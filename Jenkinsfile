pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'gustavosduarte/bikcraft-teste'
    BUILD_ID = "${env.BUILD_ID}"
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
            sh 'bash -c "docker compose stop bikcraft-teste"'
            sh 'bash -c "export DOCKER_IMAGE=${DOCKER_IMAGE}"'
            sh 'bash -c "export BUILD_ID=${BUILD_ID}"'
            sh 'bash -c "docker-compose build --no-cache bikcraft-teste"'
            sh 'bash -c "docker-compose up -d bikcraft-teste"'
          }
      }
    }
  }
}