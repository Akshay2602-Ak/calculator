
resource "aws_security_group" "this" {
  name        = "${var.project_name}-backend-sg"
  description = "Security group for Calculator backend"
  vpc_id      = var.vpc_id

  # SSH access only from your trusted public IP
  ingress {
    description = "SSH from trusted admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  # HTTP access for initial testing
  ingress {
    description = "HTTP access for initial testing"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic for updates and package downloads
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-backend-sg"
    Project = var.project_name
  }
}
