# terraform {
#   backend "s3" {
#     bucket = "<SOME_BUCKET>"
#     key    = "<SOME_DOMAIN>"
#     region = "<SOME_REGION>"
#   }
# }
# data "terraform_remote_state" "network" {
#   backend = "s3"
#   config {
#     bucket = "<SOME_BUCKET>"
#     key    = "${var.domain}"
#     region = "${var.region}"
#   }
# }
variable "region" {
  type    = "string"
  default = "us-west-2"
}
variable "name" {
  type    = "string"
  default = "ipa"
}
variable "volume_size" {
  type    = "string"
  default = "20"
}
variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}
variable "domain" {
  type = "string"
}
