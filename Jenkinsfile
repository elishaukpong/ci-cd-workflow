pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                script {
                    sh 'cp -r /var/application/* /var/application/.env.example $WORKSPACE'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Use a PHP Docker image and run commands inside it
                    docker.image('php-srv').inside("--cpus 1.5 --memory 3g -e HOME=$WORKSPACE -e TMPDIR=$WORKSPACE/tmp") {
                        sh 'composer install --prefer-dist --no-ansi --no-interaction --no-progress -q -o'
                        sh 'cp .env.example .env'
                        sh 'php artisan key:generate'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                   docker.image('php-srv')
                   .inside("--cpus 1.5 --memory 3g -e HOME=$WORKSPACE -e TMPDIR=$WORKSPACE/tmp") {
                     dir('./') {
                       sh 'php artisan test'
                     }
                   }
                }
            }
        }

        stage ('Deploy') {
            input {
                message "Where are you deploying to?"
                parameters {
                    choice(
                        name: 'SERVER',
                        choices: ['production', 'staging'],
                        description: 'Pick a server to deploy to:'
                    )
                }
            }

            steps {
              echo "You picked: ${SERVER}"
            }
        }
    }
}
