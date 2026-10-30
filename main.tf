provider "aws" {
  region = "ap-southeast-2"
}

data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "example" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-example"
  }
}
