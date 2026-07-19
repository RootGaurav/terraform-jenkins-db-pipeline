variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0b6d9d3d33ba97d99"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "terraform-demo"
}

variable "environment" {
  default = "dev"
}

variable "instance_count" {
  default = 1
}

variable "mysql_enabled" {
  type = bool
}

variable "postgres_enabled" {
  type = bool
}

variable "mongodb_enabled" {
  type = bool
}

variable "redis_enabled" {
  type = bool
}

variable "cassandra_enabled" {
  type = bool
}
