variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"  # Amazon Linux 2
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_password" {
  description = "RDS root password"
  type        = string
  sensitive   = true
}