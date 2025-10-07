output "input_bucket" {
  value = module.s3.input_bucket
}

output "api_url" {
  value = module.api_gateway.invoke_url
}

output "sfn_arn" {
  value = module.step_functions.sfn_arn  # Assume output
}