# Variables retrieved from ADO pipeline
variable "BRANCH_NAME" {
  type    = string
  default = "blank"
}

variable "BUILD_NUMBER" {
  type    = string
  default = "blank"
}

variable "DEPLOYED_BY" {
  type    = string
  default = "blank"
}

variable "PIPELINE_NAME" {
  type    = string
  default = "blank"
}

variable "PROJECT_NAME" {
  type    = string
  default = "blank"
}

# Merge variables from ADO with tags defined in variables.tfvars
locals {
  tags = merge({
    branchName   = var.BRANCH_NAME
    buildNumber  = var.BUILD_NUMBER
    deployedBy   = var.DEPLOYED_BY
    pipelineName = var.PIPELINE_NAME
    projectName  = var.PROJECT_NAME
  }, var.az_tags)
}

