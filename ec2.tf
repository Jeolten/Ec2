resource "aws_instance" "web" {
  ami           =  ami-0c0e36522a91d66e1
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}