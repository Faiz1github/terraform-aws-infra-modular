terraform {
  backend "s3" {
    bucket         = "awsterrafromfaizanlocaltfstate"  # same as created above
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

