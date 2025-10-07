resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alert when CPU > 80%"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }
  alarm_actions = [var.sns_arn]
}

resource "aws_sns_topic" "alerts" {
  name = "web-alerts"
}

resource "aws_cloudwatch_log_group" "web" {
  name              = "/aws/ec2/web"
  retention_in_days = 14
}