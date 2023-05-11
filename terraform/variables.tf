variable "project_id" {
  description = "The project ID to deploy resources into"
}

variable "subnetwork" {
  description = "The name of the subnetwork to deploy instances into"
  default = "default"
}

variable "instance_name" {
  description = "The desired name to assign to the deployed instance"
  default     = "docker-vms"
}

variable "zone" {
  description = "The GCP zone to deploy instances into"
  type        = string
  default = "europe-west1-b"
}

variable "client_email" {
  description = "Service account email address"
  type        = string
}

variable script_file {
  type        = string
  default     = "./script.sh"
}
