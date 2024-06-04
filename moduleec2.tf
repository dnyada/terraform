provider "aws" {
  region = "us-east-1"
}
module "ec2" {
    source = "./module/ec2"
    this_aws_instance_ami = "ami-0eb5115914ccc4bc2"
    this_aws_instance_instance_type  = "t2.micro"
    //this_aws_instance_subnet = module.aws_vpc.aws_subnet_this_public
    this_aws_instance_key_name = "delete_oregon_anup"
    this_aws_instance_availability_zone = "us-west-2b"
    this_aws_instance_volume_size = 15
    this_aws_instance_count = 2
    this_aws_instance_user_data_base64 = true
    this_aws_instance_tags =  "Terraform_instance"
    this_aws_instance_subnet = module.vpc.subnet_id
    this_sg_vpc_id = module.vpc.vpc_id
    //this_aws_vpc_id = module.aws_vpc.aws_vpc_id
}
