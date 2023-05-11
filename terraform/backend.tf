terraform {
    backend "gcs" {
        credentials = "/tmp/serviceaccount.json"
        bucket      = "terraform-state-docker"
        prefix  = "terraform_docker_pipeline_gitlab"
    }
}