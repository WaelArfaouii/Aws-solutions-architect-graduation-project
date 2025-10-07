resource "aws_s3_bucket" "input" {
  bucket = "input-${random_string.bucket.result}"
}

resource "aws_s3_bucket" "output" {
  bucket = "output-${random_string.bucket.result}"
}

resource "random_string" "bucket" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket_notification" "input" {
  bucket = aws_s3_bucket.input.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "uploads/"
  }
}

resource "aws_s3_bucket_policy" "input" {
  bucket = aws_s3_bucket.input.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowLambda"
        Effect    = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.input.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "input" {
  bucket = aws_s3_bucket.input.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}