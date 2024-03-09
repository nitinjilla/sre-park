variable "aws_ami" {
  default     = ""
  type        = string
  description = "Amazon Marketplace Image used for our instance OS"
}

resource "aws_instance" "app" {

  ami               = var.aws_ami
  instance_type     = "t3.micro"
  key_name          = "homelabs-root-key"
  availability_zone = var.aws_vpc_zone


  network_interface {
    network_interface_id = aws_network_interface.ani.id
    device_index         = 0
  }

  tags = {
    Name = "test-server"
  }

}

# Provide a private IP for the the above server.
resource "aws_network_interface" "ani" {
  subnet_id       = aws_subnet.subnet.id
  private_ips     = ["10.0.1.10"]
  security_groups = [aws_security_group.allow_web.id]
}

# EIP may require IGW to exist prior to association. 
# Use depends_on to set an explicit dependency on the IGW.
resource "aws_eip" "eip" {

  domain                    = "vpc"
  network_interface         = aws_network_interface.ani.id
  associate_with_private_ip = "10.0.1.10"
  depends_on                = [aws_internet_gateway.igw, aws_instance.app]
}