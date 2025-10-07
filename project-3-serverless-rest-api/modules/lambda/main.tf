# Common role
resource "aws_iam_role" "lambda_role" {
  name = "todo-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "lambda.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy" "lambda_dynamo" {
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { Action = ["dynamodb:*"], Effect = "Allow", Resource = var.dynamodb_arn },
      { Action = ["logs:*"], Effect = "Allow", Resource = "arn:aws:logs:*:*:*" }
    ]
  })
}

# Get Lambda
resource "aws_lambda_function" "get" {
  filename         = data.archive_file.get.output_path
  function_name    = "todo-get"
  role             = aws_iam_role.lambda_role.arn
  handler          = "getItem.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.get.output_base64sha256

  environment {
    variables = { TABLE_NAME = var.table_name }
  }
}

data "archive_file" "get" {
  type        = "zip"
  source_file = "../lambda-functions/getItem.js"
  output_path = "/tmp/get.zip"
}

resource "aws_lambda_permission" "get_api" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/*/*"
}

# Similar for create, update, delete...
resource "aws_lambda_function" "create" {
  filename         = data.archive_file.create.output_path
  function_name    = "todo-create"
  role             = aws_iam_role.lambda_role.arn
  handler          = "createItem.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.create.output_base64sha256

  environment {
    variables = { TABLE_NAME = var.table_name }
  }
}

data "archive_file" "create" {
  type        = "zip"
  source_file = "../lambda-functions/createItem.js"
  output_path = "/tmp/create.zip"
}

resource "aws_lambda_permission" "create_api" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/*/*"
}

resource "aws_lambda_function" "update" {
  filename         = data.archive_file.update.output_path
  function_name    = "todo-update"
  role             = aws_iam_role.lambda_role.arn
  handler          = "updateItem.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.update.output_base64sha256

  environment {
    variables = { TABLE_NAME = var.table_name }
  }
}

data "archive_file" "update" {
  type        = "zip"
  source_file = "../lambda-functions/updateItem.js"
  output_path = "/tmp/update.zip"
}

resource "aws_lambda_permission" "update_api" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/*/*"
}

resource "aws_lambda_function" "delete" {
  filename         = data.archive_file.delete.output_path
  function_name    = "todo-delete"
  role             = aws_iam_role.lambda_role.arn
  handler          = "deleteItem.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.delete.output_base64sha256

  environment {
    variables = { TABLE_NAME = var.table_name }
  }
}

data "archive_file" "delete" {
  type        = "zip"
  source_file = "../lambda-functions/deleteItem.js"
  output_path = "/tmp/delete.zip"
}

resource "aws_lambda_permission" "delete_api" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.delete.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/*/*"
}