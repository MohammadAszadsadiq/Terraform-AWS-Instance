# s3 bucket creation

resource "aws_s3_bucket" "dev-data" {
    bucket = "dev-data-ajbj"
     versioning {
    enabled = true
  }
    tags = {
        Name="dev-data-ajabj"
        environment="dev"
    }
}

/*

resource "aws_s3_bucket_public_access_block" "dev-data-access" {
  bucket = aws_s3_bucket.dev-data.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
*/
resource "aws_s3_bucket_ownership_controls" "s3-control-bucket-owner" {
  bucket = aws_s3_bucket.dev-data.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}



resource "aws_s3_bucket_public_access_block" "S3BucketPublicAccess" {
  bucket = aws_s3_bucket.dev-data.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "dev-data-acl" {
    depends_on = [ aws_s3_bucket_ownership_controls.s3-control-bucket-owner, aws_s3_bucket_public_access_block.S3BucketPublicAccess ]
    bucket = aws_s3_bucket.dev-data.id
    acl = "public-read-write"
}

resource "aws_s3_bucket_policy" "hosting_bucket_policy" {
    bucket = aws_s3_bucket.dev-data.id

    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::dev-data-ajbj/*"
            }
        ]
    })
    depends_on = [ aws_s3_bucket_public_access_block.S3BucketPublicAccess ]
}
resource "aws_s3_bucket_object" "upload_files_bucket" {
   for_each = fileset("./staticfiles/" ,"**")
  bucket = aws_s3_bucket.dev-data.id
  key=each.value
  source="./staticfiles/${each.value}"
  
}
