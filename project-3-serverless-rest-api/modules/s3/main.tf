resource "aws_s3_bucket" "frontend" {
  bucket = "todo-frontend-${random_string.bucket.result}"
}

resource "random_string" "bucket" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.frontend.arn}/*"
    }]
  })
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.frontend.id
  key    = "index.html"
  source = "../frontend/index.html"  # Assume a simple HTML file
  content_type = "text/html"
}

# Add JS for API calls
resource "aws_s3_object" "app_js" {
  bucket = aws_s3_bucket.frontend.id
  key    = "app.js"
  source = "../frontend/app.js"
  content_type = "application/javascript"
}