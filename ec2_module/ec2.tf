resource "aws_instance" "ec2_1" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name                = module.keypair.key_name
    tags = {
    Name = var.tags

    }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    tags = {
      Name = "root disk"
    }
  }

  #ebs_block_device {
  #  delete_on_termination = true
  #  encrypted             = true
  #  device_name           = "/dev/sdb"
  #  volume_size           = 900
  #  volume_type           = "gp3"
  #   tags = {
  #     Name = "secound disk"
  #  }
  # }

}

