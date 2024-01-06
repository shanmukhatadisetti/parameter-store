terraform {
  backend "s3" {
    bucket = "shanmukhatadisetti"
    key    = "parameter-store/terraform.statefile"
    region = "us-east-1"
  }
}