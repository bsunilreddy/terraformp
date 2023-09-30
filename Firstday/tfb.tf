terraform {
  backend "s3" {
    bucket         = "sunilshell" # Replace with your S3 bucket name
    key            = "terraform.tfstate" # Replace with the desired state file name
    region         = "us-east-1" # Replace with your bucket's region
    
  }
}
