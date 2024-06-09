# CI/CD Workflow Simulation using Docker

So one docker file

[x] Create a 2 Nginx instances
- staging
- ⁠production

[x] Create an instance of php that will serve the two servers

[x] Create an instance of Jenkins

[x] Create an instance of Prometheus

[x] Create an instance of Grafana

Create an instance of Cadvisor

[x] Create an instance of mysql

Create a dummy laravel app that runs some long queries and all that

The idea is

Prometheus and Grafana will monitor and visualize the vitals of the two servers

Jenkins will watch a branch and provide an interface to deploy either to staging or production