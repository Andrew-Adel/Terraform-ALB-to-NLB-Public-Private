resource "aws_s3_bucket" "tfbucket" {
  bucket = "tfbucket-${var.bucket_name}"

  tags = {
    Descriptione = "this bucket from tf module"
  }
}