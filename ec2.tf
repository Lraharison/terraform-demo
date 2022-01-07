data "aws_ami" "amiDatasource" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }
}

resource "aws_instance" "myEc2" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.amiDatasource.id
  tags = {
    Name = "myEc2Terraformed"
  }
}