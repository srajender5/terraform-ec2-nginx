resource "aws_dynamodb_table" "tf-state_locks" {
  name         = "nginx-locking"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}