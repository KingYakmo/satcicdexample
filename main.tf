terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
    credentials = "bigmos-project-2024-419920-79eb77330b9c.json"
    project = var.project
    region = var.region
  # Configuration options
}


# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data_project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}


locals {
    labels = {
        "data-project" = var.data_project
    }
}

variable "project" {
    type= string
    default = "bigmos-project-2024-419920"
    description = "ID Google project"
}

variable "region" {
    type= string
    default = "asia-northeast1"
    description = "Region Google project"
}

variable  "data_project" {
    type = string
    default = "yakmosat2_cicd_project"
    description = "Name of data pipeline project to use as resource prefix"
}






