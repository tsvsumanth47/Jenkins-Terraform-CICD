data "aws_ami" "app_ami" {
  most_recent = true
  #owners = ["CentOS"]
  filter {
    name = "name"
    #values = ["amzn2-ami-hvm*"]       #reference -- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html , https://access.redhat.com/solutions/15356
    values = ["CentOS-7*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
resource "aws_instance" "ec2-instance" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.app_ami.id
  count         = 1
  tags = {
    Name       = "terraform instance"
    Env        = "Prod"
    Created-by = "terraform"
  }
}