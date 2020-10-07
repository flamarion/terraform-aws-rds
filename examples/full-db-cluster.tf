terraform {
  required_version = "~> 0.12"
}

provider "random" {
  version = "~> 2.3"
}

provider "aws" {
  version = "~> 2.59"
  region  = "eu-central-1"
}

module "db_cluster" {
  source                 = "../"
  apply_immediately      = true
  availability_zones     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  cluster_identifier     = "flama"
  database_name          = "flamadb"
  db_subnet_group_name   = "db_subnet_group_name"
  engine                 = "aurora-postgresql"
  master_password        = "SuperS3cret"
  master_username        = "flama"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["security-group-id-1"]
  replica_count          = 2
  identifier              = "flama-instance"
  instance_class         = "db.t3.medium"
  db_tags = {
    "Name" = "flama-db-cluster"
  }
}
