resource "instance_name" {
  ami           = var.ami_id
  instance_type = "instance_type"
  key_name      = var.key_name
  subnet_id     = private_subnet[0]
  

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 100
    delete_on_termination = true
  }
}
