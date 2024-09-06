resource "aws_kms_key" keyname {
  description = "kms key for efs"
  deletion_window_in_days = 10
  enable_key_rotation = true

  tags = {
    Name="My EFS Key"
  }
}

