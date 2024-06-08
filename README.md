# CI/CD Workflow Simulation using Docker

So one docker file

Create a 2 Nginx instances
- staging
- ⁠production

Create an instance of php that will serve the two servers

Create an instance of Jenkins

Create an instance of Prometheus

Create an instance of Grafana

Create an instance of mysql

Create a dummy laravel app that runs some long queries and all that

The idea is

Prometheus and Grafana will monitor and visualize the vitals of the two servers

Jenkins will watch a branch and provide an interface to deploy either to staging or production