terraform { 
  required_providers {
    vault = {
      source  = "hashicorp/vault"
    }
    aws = {
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
    }
  } 
}

provider "aws" {
  region = "us-west-2"
}

provider "vault" {}

resource "vault_kv_secret_v2" "example" {
  mount                      = "kv"
  name                       = "super-secret-data"
  data_json                  = jsonencode(
  {
    zip       = "zap",
    foo       = "bar"
  }
  )
}

resource "random_pet" "example" {}

resource "aws_s3_bucket" "example" {
  bucket = random_pet.example.id
}