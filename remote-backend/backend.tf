terraform {
  backend "s3" {
    bucket="gitlab-bucket-3-env"   //name of the bucket
    bucket_key="terraform/tfstate.tfstate"  //folder/name of state file(rename it to key)
    region="us-east-1"
  }
}