provider "aws" {
  region = "us-east-1"
access_key =""
secret_key =""
}

resource "aws_instance" "this_aws_instance"{
for_each        = toset(var.aws_ami)
ami           =each.value
key_name        = "1"
instance_type   = "t2.micro"
}
variable "aws_ami" {
type = list(string)
default = ["","","",""]
}

variable "aws_user_name" {
type = list(string)
deafult ["","","","",""]
