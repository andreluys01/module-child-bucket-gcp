terraform {
  backend "gcs" {
    bucket  = "terraform-state-dev-unifique"
    prefix  = "terraform/state/bucket-apigee"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.24"
    }
  }
}

provider "google" {}

module "apigee-integration" {
 
  source = "github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "apigee-integration-dev"
  location                      = "us-east1"
  storage_class                 = "STANDARD"
  uniform_bucket_level_access   = true
  public                        = false
  project                       = "unifique-5g"
}