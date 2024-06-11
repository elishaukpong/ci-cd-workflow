# CI/CD Workflow Simulation using Docker

This repo is a containerized workflow of an application, a ci-cd pipeline to deploy the application
to either a staging or production server and also with monitoring setup using prometheus with 
data aggregated from cAdvisor and Pecona MMS (for monitoring MySQL instance), visualized with Grafana.

It starts the simulation from the `./application` folder, this folder simulates a git repo, a folder
on your machine, basically where you code or store codes, it is the starting point and this code will be
delivered to either the staging or production environment using Jenkins as the CI/CD pipeline.

When you access Jenkins, You have access to a dashboard that you can kickstart a blue ocean deployment. 
This checks out the code, installs all dependencies and setup, runs the tests and then prompts you to 
choose either the production or staging server and then simulates a deploy to the server which can be 
accessed on your browser (see more at SETUP section). 

The filesystem for the staging server can be found at `./filesystem/staging` and production server 
filesystem at `./filesystem/production` all in this same folder but they will be access differently at
`production.ci-workflow.test:82` and `staging.ci-workflow.test:81` respectfully after we are done setting up.

## Base Requirements
While this might sound very intuitive but it is worthy of mention that you need to have docker installed
on the machine you want to run this simulation on.

## Steps to setup simulation

//coming soon

## NGINX Configs for staging and production servers

We have two instances of Nginx that is sets up to serve the production and staging content,
the urls are:
 - `production.ci-workflow.test:{PRODUCTION_PORT}`
 - `staging.ci-workflow.test:{STAGING_PORT}`

The ports are provided to avoid conflicts on the host machine, you can also use proxy pass to
avoid specifying the port on the browser but that would need another instance of nginx and we didn't
want that, at least not now.

### Config for PRODUCTION
This file can be found at `./docker/nginx/production/default.conf` and the two important configs
are:
```
server_name production.ci-workflow.test;
root /var/www/html/production/public;
```

if you want to serve your production contents on another url, please update the server name details
and to serve the files in a different folder, update the root directory.

### Config for STAGING
This file can be found at `./docker/nginx/staging/default.conf` and the two important configs
are:
```
server_name staging.ci-workflow.test;
root /var/www/html/staging/public;
```

if you want to serve your production contents on another url, please update the server name details
and to serve the files in a different folder, update the root directory.

## Jenkins Config

The Jenkinsfile used for this project can be found in the root directory and provides steps for the 
CI/CD pipeline.

```
pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                script {
                    ...
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    ...
                }
            }
        }

        stage('Test') {
            steps {
                script {
                   ...
                }
            }
        }

        stage ('Deploy') {
            ...

            steps {
              ...
            }
        }
    }
}

```

This defines four steps:
- Setup - simulates cloning the project to the jenkins workspace
- Build - runs composer install and env setups etc
- Test - runs tests on the project
- Deploy - asks for a server to deploy to and deploys

How to use this file will be mentioned in the setup section of Jenkins.

## Dockerfile Services Used

The docker file has 7 services running

- Prometheus
- Grafana
- cAdvisor
- Jenkins
- 2 instances of Nginx (Staging and Production)
- PHP
- MySQL

## What is cAdvisor?

cAdvisor stands for container advisor and was developed then open-sourced by Google.
Its job is to collect and aggregate data on docker containers - so if you're running your
application and you need the metrics for the container to probably monitor on a monitoring
platform like Prometheus (in our case) then cAdvisor gives you every detail you need.

It has a web based interface and can be access at: localhost:{CADVISOR_PORT} (substitute the port number for the one defined in your env file)
the UI is pretty intuitive.

## What is Jenkins

Jenkins is yet another open source tool that is widely utilized for CI/CD pipelines. It helps to automate
building, testing and deploying softwares.

It handles all this process to an almost intuitive web interface which can be access at: localhost:{JENKINS_PORT} (substitute the port number for the one defined in your env file)

Setting up Jenkins for the first time would require a password which can be found inside the `./docker/jenkins/secrets/initialAdminPassword` file 
and then follow the prompts to complete the setup.

## What is Prometheus
// coming soon

## What is Grafana
// coming soon

## What is Nginx
// coming soon

## What is PHP
// coming soon

## What is MySQL
// coming soon
