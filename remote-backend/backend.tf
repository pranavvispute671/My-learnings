terraform {
  backend "s3" {
    bucket="gitlab-bucket-3-env"   //name of the bucket
    key="terraform/tfstate.tfstate"  //folder/name of state file
    region="us-east-1"
    access_key="AKIA6GBMGAX6CWVGOLH7"
    secret_key="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"
  }
}