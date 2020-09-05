terraform {
  required_providers {
    minio = {
      source  = "terraform.mutualis.com/mutualis/minio"
      version = "1.1.0"
    }
  }
  required_version = ">= 0.13"
}

provider "minio" {
  minio_server = "backup.mutualis.com"
  minio_region = "us-east-1"
  minio_access_key = var.minio_access_key
  minio_secret_key = var.minio_secret_key
}

resource "minio_s3_bucket" "test" {
  bucket = "test"
  acl    = "public"
}
