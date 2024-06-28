variable "region" {
  default = "eu-west-1"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  default     = "your-data-lake-bucket"
}

variable "sftp_user_name" {
  description = "The name of the SFTP user"
  default     = "agency_sftp_user"
}

variable "public_key_path" {
  description = "Path to the public SSH key for the SFTP user"
  default     = "/root/.ssh/id_ed25519.pub"
}

variable "alert_email" {
  description = "Email for alerts"
  default     = "varalakshmitarini13@gmail.com"
}

