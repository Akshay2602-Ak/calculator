
variable "aws_region" {
  description = "calculator backend"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project resource name prefix"
  type        = string
  default     = "calculator"
}

variable "vpc_cidr" {
  description = "VPC IPv4 CIDR"
  type        = string
  default     = "10.30.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet IPv4 CIDR"
  type        = string
  default     = "10.30.1.0/24"
}

variable "admin_ip" {
  description = "Your trusted public IPv4 address in CIDR notation"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.admin_ip)) && can(regex("/32$", var.admin_ip))
    error_message = "admin_ip must be one IPv4 address with /32, such as 203.0.113.10/32."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "/home/lenovo/ .ssh/calculator-backend.pub"
}
