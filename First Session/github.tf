terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}


resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"
}

