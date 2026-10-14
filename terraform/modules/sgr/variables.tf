
variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "admin_ip" {
  description = "Trusted public IPv4 address in CIDR notation"
  type        = string
}