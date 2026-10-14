
variable "project_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public_key_path" {
  description = "Path to the SSH public key file"
  type        = string

}
