terraform {

  required_version = ">=1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}

provider "aws" {
  alias = "north"
  region = "eu-north-1"

}