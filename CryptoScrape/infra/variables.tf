variable "project_id" {
  type        = string
  description = "Project ID"
  default     = "kubernetes-infra-384113"
}

variable "zone" {
  type    = string
  default = "europe-west2-a"
}

variable "region" {
  type    = string
  default = "eu-west2"
}

variable "auth_file" {
  type        = string
  description = "GCP authentication file"
}

variable "storage-class" {
  type    = string
  default = "REGIONAL"
}

variable "backend-bucket-name" {
  type    = string
  default = "tf-backend"
}