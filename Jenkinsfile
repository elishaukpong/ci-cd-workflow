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
                    // Use a MySQL Docker image and run commands inside it

                    docker.image('mysql')
                      .withRun('--cpus 1 --memory 1g -e "MYSQL_ROOT_PASSWORD=secret" -e "MYSQL_DATABASE=testing"') { d ->

                        docker.image('mysql').inside("--link ${d.id}:db") {
                          /* Wait until mysql service is up */
                          sh 'printf "Waiting for MySQL \n"'
                          sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
                        }

                        docker.image('php-srv')
                        .inside("--cpus 1.5 --memory 3g -e HOME=$WORKSPACE -e TMPDIR=$WORKSPACE/tmp --link ${c.id}:mysql") {
                          dir('./') {
                            sh 'php artisan test'
                          }
                        }
                      }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying"
                }
            }
        }
    }
}
