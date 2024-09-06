resource "aws_efs_file_system" "my-efs" {
  encrypted = true
  kms_key_id = aws_kms_key.keyname.arn

  tags = {
    Name="My EFS with KMS Key"
  }
}

resource "aws_efs_mount_target" "efs-mount-target" {
  subnet_id = aws_subnet.efs-subnet.id
  file_system_id = aws_efs_file_system.my-efs.id
}