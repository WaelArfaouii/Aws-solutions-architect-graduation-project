resource "aws_sfn_state_machine" "processor_workflow" {
  name     = "ImageProcessingWorkflow"
  role_arn = var.sfn_role_arn

  definition = jsonencode({
    Comment = "Image upload -> Process -> Store"
    StartAt = "ProcessImage"
    States = {
      ProcessImage = {
        Type = "Task"
        Resource = var.lambda_arn
        End = true
      }
    }
  })
}