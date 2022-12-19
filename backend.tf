/*resource "aws_s3_bucket" "statebucket" {
  bucket = "raj-tf-bucket"

  tags = {
    Name        = "raj-tfstate-bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}*/
terraform {
  backend "s3" {
    bucket  = "raj-tf-bucket"
    key     = "terraform-state/nginx-jenkins"
    region  = "ap-south-1"
    dynamodb_table = "nginx-locking"
    encrypt = true
  }
}
