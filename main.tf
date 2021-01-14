# DB Cluster
resource "random_password" "master_password" {
  length  = 10
  special = false
}


resource "aws_rds_cluster" "db_cluster" {
  apply_immediately      = var.apply_immediately
  availability_zones     = var.availability_zones
  cluster_identifier     = var.cluster_identifier
  database_name          = var.database_name
  db_subnet_group_name   = var.db_subnet_group_name
  engine                 = var.engine
  master_password        = var.master_password == "" ? random_password.master_password.result : var.master_password
  master_username        = var.master_username
  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_ids
  tags                   = var.db_tags
}

resource "aws_rds_cluster_instance" "db_instance" {
  count                = var.replica_count
  identifier           = "${var.identifier}-${count.index}"
  cluster_identifier   = aws_rds_cluster.db_cluster.id
  engine               = var.engine
  instance_class       = var.instance_class
  publicly_accessible  = false
  db_subnet_group_name = var.db_subnet_group_name
  apply_immediately    = var.apply_immediately
  tags                 = var.db_tags
}
