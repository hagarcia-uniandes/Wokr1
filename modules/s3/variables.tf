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

variable "name" {
  description = "Name of the resource. Conflicts with name_prefix"
  default     = ""
}
