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

variable "vpc_security_group_ids" {
  type        = set(string)
  description = "Ids of default VPC Security Group"
  default     = null
}

variable "vpc_subnet_id" {
  type        = string
  description = "Id of default subnet"
  default     = null
}