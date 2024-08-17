terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.40.0"
    }
  }

  required_version = "~> 1.9.4"
}