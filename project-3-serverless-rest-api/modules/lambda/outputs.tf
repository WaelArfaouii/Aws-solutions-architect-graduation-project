output "get_invoke_arn" {
  value = aws_lambda_function.get.invoke_arn
}

output "create_invoke_arn" {
  value = aws_lambda_function.create.invoke_arn
}

output "update_invoke_arn" {
  value = aws_lambda_function.update.invoke_arn
}

output "delete_invoke_arn" {
  value = aws_lambda_function.delete.invoke_arn
}