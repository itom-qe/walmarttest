variable "prefix" {
  description = "The prefix used for all resources in this example"
  default = "npr001"
}

variable "region" {}


variable "user" {
  description = "User requesting the resources"
  default = "admin"
}

variable "cost_center" {
  description = "Cost Center of the User requesting the resources"
  default = "admin"
}

variable "subscriptionId" {}
variable "clientId" {}
variable "clientSecret" {}
variable "tenantId" {}
