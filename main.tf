terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
 region = "us-east-1" 
 profile = "default"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "muhammad.ali.bucket"  
  #acl    = "public-read"
  
  tags = {
    Name        = "muhammad.ali.bucket"
    Environment = "Production"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = "${path.module}/index.html"
  content_type = "text/html"
}
