variable "ami_id" {}
variable "instance_type" {}
variable "sg_id" {}
variable "iam_profile" {}
variable "rds_endpoint" {}
variable "private_subnets" { type = list(string) }
variable "tg_arn" {}