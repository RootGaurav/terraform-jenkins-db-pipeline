data "aws_vpc" "default" {

  default = true

}

data "aws_subnets" "default" {

  filter {

    name = "vpc-id"

    values = [
      data.aws_vpc.default.id
    ]

  }

}

module "security_group" {

  source = "./modules/security-group"

  vpc_id = data.aws_vpc.default.id

}

module "mysql" {

  source = "./modules/ec2"

  count = var.mysql_enabled ? var.instance_count : 0

  ami = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  security_group_id = module.security_group.sg_id

  environment = var.environment

  instance_name = "mysql-${var.environment}-${format("%02d", count.index + 1)}"

  user_data = file("${path.root}/userdata/mysql.sh")

}

module "postgres" {

  source = "./modules/ec2"

  count = var.postgres_enabled ? var.instance_count : 0

  ami = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  security_group_id = module.security_group.sg_id

  environment = var.environment

  instance_name = "postgres-${var.environment}-${format("%02d", count.index + 1)}"

  user_data = file("${path.root}/userdata/postgres.sh")

}

module "redis" {

  source = "./modules/ec2"

  count = var.redis_enabled ? var.instance_count : 0

  ami = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  security_group_id = module.security_group.sg_id

  environment = var.environment

  instance_name = "redis-${var.environment}-${format("%02d", count.index + 1)}"

  user_data = file("${path.root}/userdata/redis.sh")

}

module "mongodb" {

  source = "./modules/ec2"

  count = var.mongodb_enabled ? var.instance_count : 0

  ami = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  security_group_id = module.security_group.sg_id

  environment = var.environment

  instance_name = "mongodb-${var.environment}-${format("%02d", count.index + 1)}"

  user_data = file("${path.root}/userdata/mongodb.sh")

}

module "cassandra" {

  source = "./modules/ec2"

  count = var.cassandra_enabled ? var.instance_count : 0

  ami = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  security_group_id = module.security_group.sg_id

  environment = var.environment

  instance_name = "cassandra-${var.environment}-${format("%02d", count.index + 1)}"

  user_data = file("${path.root}/userdata/cassandra.sh")

}
