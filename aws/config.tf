terraform {
  backend "s3" {
    bucket = "codejamninja-terraform"
    key    = "ipa.codejam.ninja/ipa"
    region = "us-west-2"
  }
}
data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "codejamninja-terraform"
    key    = "${var.name}.${var.domain}/ipa"
    region = "${var.region}"
  }
}
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
}
variable "region" {
  type    = "string"
  default = "us-west-2"
}
variable "ami" {
  type    = "string"
  default = "ami-01ed306a12b7d1c96"
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
  type    = "string"
  default = "codejam.ninja"
}
