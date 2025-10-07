output "table_name" {
  value = aws_dynamodb_table.todos.name
}

output "table_arn" {
  value = aws_dynamodb_table.todos.arn
}