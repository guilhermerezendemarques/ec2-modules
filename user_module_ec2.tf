module "ec2" {
     source = "./ec2_module"
     ami = "ami-0aeeebd8d2ab47354"
     instance_type =  "m5a.large"
     subnet_id = element(module.vpc.private_subnets,1)
     root_volume_size = 100

    tags = "dooca-bridge"
    key_name = "dooca-bridge"
    depends_on = [module.vpc] 

}

module "ec2_1" {
     source = "./ec2_module"
     ami = "ami-0aeeebd8d2ab47354"
     instance_type =  "r5a.xlarge"
     subnet_id = element(module.vpc.private_subnets,1)
     root_volume_size = 100
     tags = "dooca-redis"
     key_name = "dooca-redis"
   
    depends_on = [module.vpc] 

}

module "bastion" {
     source = "./ec2_module"
     ami = "ami-0fa60543f60171fe3"
     instance_type =  "t3.medium"
     subnet_id = element(module.vpc.public_subnets,0)
     root_volume_size = 30
     tags = "dooca-bastion"
     key_name = "dooca-bastion"
   
    depends_on = [module.vpc] 

}


