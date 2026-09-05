#s3
resource "aws_s3_bucket" "remote-s3-bucket" {
  bucket = "e-commerce-project-remote-bucket11"

  tags ={
    Name="e-commerce-project-remote-bucket11"
  }
}

#dynamoDB
resource "aws_dynamodb_table" "remote-dynamodb-aws_dynamodb_table" {
  name           = "e-commerce-project-remote-table11"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}