resource "aws_dynamodb_table" "todos" {
  name           = "Todos"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "completed"
    type = "BOOL"
  }
  global_secondary_index {
    name            = "CompletedIndex"
    hash_key        = "completed"
    projection_type = "ALL"
  }
  ttl {
    attribute_name = "expires"
    enabled        = false
  }
}