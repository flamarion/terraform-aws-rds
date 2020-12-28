variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = []
}

variable "cluster_identifier" {
  description = "String to identify the DB Cluster"
  type        = string
  default     = ""
}

variable "database_name" {
  description = "DB Name"
  type        = string
  default     = ""
}

variable "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  type        = string
  default     = ""
}

variable "engine" {
  description = "Postgresql, Mysql, Aurora"
  type        = string
  default     = "aurora-postgresql"
}

variable "master_password" {
  description = "DB Master Password"
  type        = string
  default     = "SuperS3cret"
  sensitive   = true
}

variable "master_username" {
  description = "DB Master Username"
  type        = string
  default     = ""
}

variable "skip_final_snapshot" {
  description = "Before delete skip final snapshot"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of security groups"
  type        = list(string)
  default     = []
}

variable "db_tags" {
  description = "Map of db tags"
  type        = map(string)
  default     = {}
}

variable "identifier" {
  description = "String to identify the DB Instance"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "Kind of instancd to deploy the instance"
  type        = string
  default     = "db.t3.medium"
}

variable "replica_count" {
  description = "Nunmber of replicas inside the cluster"
  type        = number
  default     = 1
}
