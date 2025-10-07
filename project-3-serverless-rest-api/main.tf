provider "aws" {
  region = var.region
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "lambda" {
  source           = "./modules/lambda"
  table_name       = module.dynamodb.table_name
  dynamodb_arn     = module.dynamodb.table_arn
  api_execution_arn = module.api_gateway.api_execution_arn  # Forward ref
}

module "api_gateway" {
  source                     = "./modules/api_gateway"
  get_lambda_invoke_arn      = module.lambda.get_invoke_arn
  create_lambda_invoke_arn   = module.lambda.create_invoke_arn
  update_lambda_invoke_arn   = module.lambda.update_invoke_arn
  delete_lambda_invoke_arn   = module.lambda.delete_invoke_arn
}

module "s3" {
  source = "./modules/s3"
}

# IAM module empty or for extras