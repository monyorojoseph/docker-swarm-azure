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
terraform apply<img width="231" alt="Screenshot 2024-05-26 at 13 25 08" src="https://github.com/monyorojoseph/docker-swarm-azure/assets/72988723/56c8e6d6-e3ae-4adc-85b3-ffa6b5b9b225">

```
<br>
Destroy resources<br>

```terraform destroy```


## Swarm Orchestration

Swarm cluster:
  - monitoring by prometheus, node-exporter grafana
  - ~~log collection by EFK~~
  - ~~Alerting prometheus nad slack~~
