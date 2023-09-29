resource "aws_iam_user" "myfirstresources" {
  name = "Senol"

  tags = {
    tag-key = "DeveloperEnver"
    environment = "dev"
  }
}