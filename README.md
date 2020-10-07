# AWS RDS (Auroraå) Module

This module is intended to create a RDS Cluster (Aurora) with the following components.

* RDS Cluster
* RDS Instance Cluster

This modules provides a non publicly accessible cluster, so a DB Subnet Group must be created in the VPC to be able deploy this module.

If you need more detailed configuration inside a VPC I recommend you use the official terraform module for AWS VPC

https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws

## Input Variables

|Name|Type|Mandatory|Default Value|Description|
|----|----|---------|-------------|-----------|
|apply_immediately|bool|no|true|Apply changes immediately|
|availability_zones|list(string)|yes|[]|List of availability zones|
|cluster_identifier|string|no|""|String to identify the DB Cluster|
|database_name|string|no|""|Database Name|
|db_subnet_group|string|yes|""|DB Subnet Group Name|
|engine|string|yes|"aurora-postgresql"|Postgresql, Mysql, Aurora|
|master_password|string|no|"SuperS3cret"|Database master password|
|master_username|string|yes|""|Database master username|
|skip_final_snapshot|bool|no|true|If set false the final snapshot need to be removed before remove the cluster|
|vpc_security_group_ids|list(string)|no|[]|List of VPC security group ids|
|identifier|string|no|""|Identifier for the DB instance in the cluster|
|instance_class|string|yes|"db.t3.medium"|Database Instance size|
|db_tags|map(string|no|{}|Database tags|
|replica_count|number|no|1|Number of replicas in the cluster|



## Outputs

The outputs available are the following

|Name|Description|
|----|-----------|
|endpoint|The endpoint address to access the DB|
|port|Database Port|
|db_name|Database Name|
|db_user|Database master username|
|db_pass|Database master password|


## Example

The full example can be found in [Examples](./examples) directory.

## Tests

TODO