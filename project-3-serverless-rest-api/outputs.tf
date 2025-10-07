output "api_url" {
  value = module.api_gateway.base_url
}

output "s3_website" {
  value = module.s3.website_url
}