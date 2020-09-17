#~~~~~~~~~~
# Control
#~~~~~~~~~~
variable "create" {
  description = "Controls resource creation"
  type        = bool
  default     = false
}

#~~~~~~~~~
# Bucket
#~~~~~~~~~
# variable "region" {
#   description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
#   default     = ""
# }

variable "name" {
  description = "Name of the resource. Conflicts with name_prefix"
  default     = ""
}
