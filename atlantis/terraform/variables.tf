variable "role_name" {
  type    = string
  default = "AdministratorRole" 
}

variable "atlantis_aws_account_id" {
  type    = string
  default = "249466986931"
}

variable "atlantis_iam_role_name" {
  type    = string
  default = "s8-atlantis"
}

variable "atlantis_iam_prod_role_name" {
  type    = string
  default = "atlantis-prod-ecs_task_execution"
}