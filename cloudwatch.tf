resource "aws_cloudwatch_log_group" "sftp_log_group" {
  name = "/aws/transfer/sftp"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "missing_data_alarm" {
  alarm_name          = "MissingDataAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "NumberOfObjects"
  namespace           = "AWS/S3"
  period              = "86400"  # 24 hours
  statistic           = "Sum"
  threshold           = "1"

  dimensions = {
    BucketName = aws_s3_bucket.data_lake.bucket
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}

