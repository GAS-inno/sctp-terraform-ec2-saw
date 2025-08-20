variable "vpc_name" {
  description = "Name tag of the VPC"
  type        = string
  default = "saw-vpc"
}


variable "vpc_ID"{
  description = "VPC ID"
  type = string
  default = "vpc-0baec0e5928d67697"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Name of instances type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Name of ami"
  type        = string
  default     = "ami-00ca32bbc84273381" # Amazon Linux 2023 AMI ID
}

variable "subnet_id" {
  description = "Name of subnet id"
  type        = string
  default     = "subnet-0ce2f722100b29f3d" # Public Subnet ID
}


