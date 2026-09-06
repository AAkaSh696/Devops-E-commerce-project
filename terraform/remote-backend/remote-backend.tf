#s3
resource "aws_s3_bucket" "remote-s3-bucket" {
  bucket = "e-commerce-project-remote-bucket11"

  tags ={
    Name="e-commerce-project-remote-bucket11"
  }
}