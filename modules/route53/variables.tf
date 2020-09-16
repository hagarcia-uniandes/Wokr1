variable "description" {
  description = "Description of the DNS Zone"
  default     = ""
}
variable "zone_name" {
  description = "DNS domain zone"
}
variable "zone_id" {
  description = "Imported Zone ID when Available"
  default     = "false"
}
variable "records" {
  type        = any
  description = "List of DNS Records to add to the DNS zone"
  default = {
    names  = []
    types  = []
    ttls   = []
    values = []
  }
}