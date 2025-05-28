# Global Variables
variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
  default = {
    Manager     = "Terraform"
    Environment = "dev"
  }
}

# Variable for KMS Key
variable "key_usage" {
  description = "The key usage for the KMS key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  description = "The customer master key specification"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "key_description" {
  description = "Description for the KMS key"
  type        = string
  default     = "KMS key managed by Terraform"
}

variable "kms_key_policy" {
  description = "The policy for the KMS key"
  type        = string
  default     = ""
}

variable "deletion_window_in_days" {
  description = "The number of days after which the KMS key will be deleted"
  type        = number
  default     = 30
}

# Variable for KMS Alias
variable "alias_name" {
  description = "The name of the KMS key alias"
  default     = "alias/tf-module-kms"
}
