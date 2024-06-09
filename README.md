# CI/CD Workflow Simulation using Docker

## Dockerfile Services

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
It's job is to collect and aggregate data on docker containers - so if you're running your
application and you need the metrics for the container to probably monitor on a monitoring
platform like Prometheus (in our case) then cAdvisor gives you every detail you need.

It has a web based interface and can be access at: localhost:{CADVISOR_PORT} (substitute the port number for the one defined in your env file)
the UI is pretty intuitive.

## Steps

So one docker file

[x] Create a 2 Nginx instances
- staging
- ⁠production

[x] Create an instance of php that will serve the two servers

[x] Create an instance of Jenkins

[x] Create an instance of Prometheus

[x] Create an instance of Grafana

[x] Create an instance of Cadvisor

[x] Create an instance of mysql

Create a dummy laravel app that runs some long queries and all that

The idea is

Prometheus and Grafana will monitor and visualize the vitals of the two servers

Jenkins will watch a branch and provide an interface to deploy either to staging or production