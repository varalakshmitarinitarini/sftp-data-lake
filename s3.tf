resource "aws_s3_bucket" "data_lake" {
  bucket = var.s3_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "retain-for-30-days"
    enabled = true

    expiration {
      days = 30
    }
  }

  tags = {
    Name        = "Data Lake Bucket"
    Environment = "Dev"
  }
}

