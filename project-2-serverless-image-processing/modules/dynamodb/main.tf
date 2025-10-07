resource "aws_dynamodb_table" "image_metadata" {
  name           = "ImageMetadata"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ImageId"
  attribute {
    name = "ImageId"
    type = "S"
  }
  attribute {
    name = "UploadTime"
    type = "S"
  }
  global_secondary_index {
    name            = "UploadTimeIndex"
    hash_key        = "UploadTime"
    projection_type = "ALL"
  }
}