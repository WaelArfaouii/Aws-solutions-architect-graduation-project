provider "aws" {
  region = var.region
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-image-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "lambda.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { Action = ["s3:GetObject", "s3:PutObject"], Effect = "Allow", Resource = "*" },
      { Action = ["dynamodb:PutItem"], Effect = "Allow", Resource = "*" },
      { Action = ["logs:*"], Effect = "Allow", Resource = "arn:aws:logs:*:*:*" }
    ]
  })
}

resource "aws_iam_role" "sfn_role" {
  name = "sfn-image-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "states.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy" "sfn_policy" {
  role = aws_iam_role.sfn_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { Action = ["lambda:InvokeFunction"], Effect = "Allow", Resource = "*" },
      { Action = ["iam:PassRole"], Effect = "Allow", Resource = aws_iam_role.lambda_role.arn }
    ]
  })
}

module "s3" {
  source      = "./modules/s3"
  lambda_arn  = module.lambda.lambda_arn
}

module "lambda" {
  source            = "./modules/lambda"
  lambda_role_arn   = aws_iam_role.lambda_role.arn
  output_bucket     = module.s3.output_bucket
  input_bucket_arn  = module.s3.input_bucket_arn  # Assume output
}

module "api_gateway" {
  source             = "./modules/api_gateway"
  lambda_invoke_arn  = module.lambda.lambda_invoke_arn  # Lambda invoke ARN
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "step_functions" {
  source        = "./modules/step_functions"
  sfn_role_arn  = aws_iam_role.sfn_role.arn
  lambda_arn    = module.lambda.lambda_arn
}