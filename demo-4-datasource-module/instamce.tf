module "ec2" {
    source = "./modules/ec2"
    instance_type = "t2.micro"
    ami = data.aws_ami.amazonlinux.id
}