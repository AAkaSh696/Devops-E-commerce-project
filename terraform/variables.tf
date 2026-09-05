variable "ami_id" {
  description = "Holds ami id for EC2 instance"
  type = string
}

variable "instance_type" {
  description = "Holds instance type of ec2 server"
  type = string
}

variable "my_enviroment" {
  description = "Holds environment"
}

variable "volume_size" {
  description = "Holds EBS volume size"
  type = number
}

variable "volume_type" {
  description = "Holds EBS volume type"
  type = string
}