terraform {
  backend "gcs" {
    bucket  = "terraform-state-dev-unifique"
    prefix  = "terraform/state/bucket"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.24"
    }
  }
}

provider "google" {}

module "bucket" {
 
  source = "git::https://github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "new-bucket-example"
  location                      = "us-east1"
  storage_class                 = "STANDARD"
  uniform_bucket_level_access   = true
  public                        = false
  project                       = "unifique-5g"
}