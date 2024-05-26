# Docker Swarm on Azure ( Login App )

Is a login app deplyed to a docker swarm on Azure, provisioned azure resources using Terraform cause it's dope.<br>
I setup monitoring, alerting and log collection for the swarm.

## Azure Resources Provisioning ( Terraform )

State is manage locally at the moment

![docker swarm azure resources architecture.](/files/azure_swarm_resources.png)

**How to provision the resources** <br>

Install terraform and azure cli installed on you machine.<br>
Terraform commands to run <br>

```
terraform init
terraform plan
terraform apply

```
<br>
Destroy resources<br>

```terraform destroy```


## Swarm Orchestration

Swarm cluster:
  - monitoring by prometheus, node-exporter grafana
  - ~~log collection by EFK~~
  - ~~Alerting prometheus nad slack~~
