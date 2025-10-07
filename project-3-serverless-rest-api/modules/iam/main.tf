# IAM for API Gateway (already in Lambda, but extra for S3 if needed)
resource "aws_iam_role_policy" "api_s3" {
  # Assume attached to API role if needed
}