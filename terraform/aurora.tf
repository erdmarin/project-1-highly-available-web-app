resource "aws_db_subnet_group" "aurora" {
  name = "${var.project_name}-aurora-subnet-group"

  subnet_ids = [
    aws_subnet.private_db_a.id,
    aws_subnet.private_db_b.id
  ]

  tags = {
    Name = "${var.project_name}-aurora-subnet-group"
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier = "${var.project_name}-aurora"

  engine = "aurora-mysql"

  database_name   = "appdb"
  master_username = var.db_username
  master_password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.aurora.name
  vpc_security_group_ids = [aws_security_group.db.id]

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name = "${var.project_name}-aurora"
  }
}

resource "aws_rds_cluster_instance" "aurora_writer" {
  identifier         = "${var.project_name}-aurora-writer"
  cluster_identifier = aws_rds_cluster.aurora.id

  instance_class = "db.t3.medium"
  engine         = aws_rds_cluster.aurora.engine

  publicly_accessible = false

  tags = {
    Name = "${var.project_name}-aurora-writer"
  }
}

resource "aws_rds_cluster_instance" "aurora_reader" {
  identifier         = "${var.project_name}-aurora-reader"
  cluster_identifier = aws_rds_cluster.aurora.id

  instance_class = "db.t3.medium"
  engine         = aws_rds_cluster.aurora.engine

  publicly_accessible = false

  tags = {
    Name = "${var.project_name}-aurora-reader"
  }
}

