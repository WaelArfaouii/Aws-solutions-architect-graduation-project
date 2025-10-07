output "invoke_url" {
  value = "${aws_api_gateway_deployment.upload.invoke_url}/upload"
}