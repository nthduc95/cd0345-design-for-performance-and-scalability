# TODO: Define the variable for aws_region
variable "region" {
  type        = string
  description = "Name of region"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "Id of default VPC"
  default     = null
}

variable "lambda_function_name" {
  type        = string
  description = "Name of lambda function"
  default     = null
}

variable "lambda_output_path" {
  type        = string
  description = "Name of lambda output path"
  default     = null
}