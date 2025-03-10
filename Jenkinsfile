pipeline {
    agent any

    environment {
        // Defina o nome da imagem Docker que será criada e enviada para o Docker Hub
        DOCKER_IMAGE = "gustavosduarte/app-teste"  // Nome da sua imagem Docker no Docker Hub
        DOCKER_CREDENTIALS = 'docker-hub-credentials' // Nome das credenciais no Jenkins
        REPO_URL = "https://github.com/GustSDuarte/Estudos-bikcraft.git"  // URL do seu repositório GitHub
        BRANCH_NAME = 'main'  // Branch que você quer monitorar (principal)
    }

    triggers {
        // Dispara o build toda vez que um push é feito na branch main
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                // Clona o repositório do GitHub
                git branch: "$BRANCH_NAME", url: "$REPO_URL"
            }
        }

        stage('Merge') {
            steps {
                script {
                    // Caso você queira fazer merge de algo, é aqui que pode ser feito
                    // Exemplo: Faz o merge da branch feature-branch com a branch main
                    sh "git checkout $BRANCH_NAME"
                    // Descomente a linha abaixo se precisar fazer um merge manual
                    // sh "git merge origin/feature-branch"
                    sh "git push origin $BRANCH_NAME"  // Push após merge (se necessário)
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construa a imagem Docker com base no Dockerfile
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Login Docker Hub') {
            steps {
                script {
                    // Realiza o login no Docker Hub usando as credenciais armazenadas no Jenkins
                    withCredentials([usernamePassword(credentialsId: "$DOCKER_CREDENTIALS", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Faz o push da imagem Docker para o Docker Hub
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Limpeza após a execução do pipeline (opcional)
            sh 'docker system prune -f'  // Limpeza de containers e imagens não utilizados
        }
    }
}
