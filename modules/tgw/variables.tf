variable "asn" {
  description = "Amazon side ASN"
}

variable "vpc_to_attach" {
  type = list
  default = ["prod","stg","dev","sharedservices"]
}

variable "shared_cidr" {
  type = string
}