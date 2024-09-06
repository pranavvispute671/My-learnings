# Define local values using join
locals {
  joined_string = join("", ["alias/", var.env, "_KMS_KEY_RDS_EFS_EBS"])
  joined_services = join(", ", ["ec2.amazonaws.com", "lambda.amazonaws.com"])
}

# Output the joined strings
output "joined_environments" {
  value = local.joined_string
}

output "joined_services" {
  value = local.joined_services
}
