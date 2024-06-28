resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "PUBLIC"

  tags = {
    Name = "SFTP Server"
  }
}

resource "aws_transfer_user" "sftp_user" {
  user_name   = var.sftp_user_name
  server_id   = aws_transfer_server.sftp_server.id
  role        = aws_iam_role.sftp_role.arn
  home_directory = "/${aws_s3_bucket.data_lake.bucket}/agency_data"

#  ssh_public_key_body = file(var.public_key_path)

  tags = {
    Name = "SFTP User"
  }
}

