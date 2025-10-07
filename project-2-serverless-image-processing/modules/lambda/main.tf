resource "aws_lambda_function" "processor" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "image-processor"
  role             = var.lambda_role_arn
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      OUTPUT_BUCKET = var.output_bucket
    }
  }

  timeout = 30
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "../lambda-function"
  output_path = "/tmp/lambda.zip"
}

resource "aws_lambda_permission" "s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.processor.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.input_bucket_arn
}