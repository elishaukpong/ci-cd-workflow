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
While this might sound very intuitive but its worthy of mention that you need to have docker installed
on the machine you want to run this simulation on.

## Steps to setup simulation
//coming soon

## NGINX Configs

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
