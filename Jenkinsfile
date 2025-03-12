pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'gustavosduarte/bikcraft-teste'
    BUILD_ID = "${BUILD_ID}"
  }

  stages{
    stage('Build Image'){
        steps{
          when {
            branch 'branch2'  // Apenas executa quando houver push para branch2
              script {
                dockerapp = docker.build ("${DOCKER_IMAGE}:${BUILD_ID}", '-f Dockerfile .')
              }
          }
        }
    }
    stage('Push Image'){
        steps{
          when {
            branch 'branch2'  // Apenas executa quando houver push para branch2
              script {
                docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
                  dockerapp.push("${BUILD_ID}")
                  }
              }
            }
        }
    }
    stage('Deploy Container') {
        steps{
          when {
            branch 'branch2'  // Apenas executa quando houver push para branch2
              script {
                sh "docker-compose stop bikcraft-teste"
                sh "docker-compose build --no-cache bikcraft-teste"
                sh "docker-compose up -d bikcraft-teste"
              }
          }
        }
    }
  }
}