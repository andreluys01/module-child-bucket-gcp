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

module "apigee-integration" {
 
  source = "github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "apigee-integration-dev"
  location                      = "us-east1"
  storage_class                 = "Standard"
  uniform_bucket_level_access   = true
  public                        = false
  project                       = "unifique-5g"
}

module "app-cdr" {
 
  source = "github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "aplication-cdr-oss-dev"
  location                      = "us-east1"
  storage_class                 = "standard"
  uniform_bucket_level_access   = true
  public                        = true
  project                       = "unifique-5g"
}

module "lets-encrypt" {
 
  source = "github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "lets-encrypt-certification-dev"
  location                      = "us-east1"
  storage_class                 = "standard"
  uniform_bucket_level_access   = true
  public                        = false
  project                       = "unifique-5g"
}

module "terraform-state-dev" {
 
  source = "github.com/andreluys01/module-root-bucket-gcp.git"

  name                          = "terraform-state-dev"
  location                      = "us-east1"
  storage_class                 = "standard"
  uniform_bucket_level_access   = true
  public                        = false
  project                       = "unifique-5g"
}