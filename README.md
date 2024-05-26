# Docker Swarm on Azure ( Login App )

Is a login app deplyed to a docker swarm on Azure, provisioned azure resources using Terraform.

## Azure Resources Provisioning ( Terraform )

I used Terraform as IAC tool, cause it's dope.
I provisioned azure resources that i believed were important for my docker swarm.

![docker swarm azure resources architecture.](/files/azure_swarm_resources.png)


## Swarm Orchestration

I deployed my login app on docker swarm
- monitoring and alerting
- Log collection
- deployment of services
