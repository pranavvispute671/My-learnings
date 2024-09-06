resource "aws_kms_key" "my_kms_key" {
  description = "My KMS Key"
  deletion_window_in_days = 10
  enable_key_rotation = true

  tags = {
    Name="My KMS KEYS"
  }
}

resource "aws_kms_alias" "my-kms-alias" {
  name = "alias/my-kms-alias"
  target_key_id = aws_kms_key.my_kms_key.id
}

output "kms-key-id" {
  description = "Id of the KMS Key"
  value = aws_kms_key.my_kms_key.id
}

output "kms-key-alias" {
  description = "the arn of key alias"
  value = aws_kms_alias.my-kms-alias.arn
}