# CI-CD-for-Docker-application

CI/CD Pipeline for Docker Container Deployment on GCP Using GitLab and Terraform

This project demonstrates a CI/CD pipeline for deploying a Docker container on Google Cloud Platform (GCP) using GitLab and Terraform.

Overview
The CI/CD pipeline uses GitLab for version control and continuous integration, and Terraform for infrastructure as code (IaC). The pipeline deploys a Docker container to a GCP instance, which is provisioned using Terraform.


The pipeline includes the following stages:

Terrafrom: Create infrustructure for our application. In our case it`s Google compute instance for main branch and Cloud Run for test branch
Build: The Docker image is built from the source code and pushed to the Artifact registry.
Deploy_to_vm: Docker container is deployed to the GCP instance. For main branch
Deploy_to_cloud_run: Docker container is deployed to Cloud Run. For test branch

Technologies Used

Docker
Terraform
GitLab
Google Cloud Platform (GCP)

Prerequisites
Before you can use this pipeline, you will need to have the following:

A GitLab account
A GCP account with billing enabled
A GCP service account with permissions to create and manage GCP resources
A GCP project ID
Docker installed on your local machine

Getting Started
To use this pipeline, follow these steps:

1) Clone the repository to your local machine.
2) Update the .gitlab-ci.yml file with your GCP project ID, service account credentials, and any other 3) necessary configuration changes.
4) Commit and push your changes to the repository.
5) Log in to your GitLab account and create a new pipeline.

The pipeline will run automatically, and you can monitor its progress in the GitLab UI.


Conclusion

This project demonstrates a CI/CD pipeline for deploying a Docker container to GCP using GitLab and Terraform. By automating the deployment process, this pipeline can help you save time and reduce the risk of errors or inconsistencies in your infrastructure.

Feel free to use this project as a starting point for your own CI/CD pipelines, and don't hesitate to reach out if you have any questions or feedback.