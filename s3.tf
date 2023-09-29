resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
  versioning {
    enable = true
  }

  tags = {
    name        = "My_bucket"
    environment = "Dev"
  }
}