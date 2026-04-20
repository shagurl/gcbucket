variable "name" {
  type        = string
  description = "The name of the bucket to create"
  default     = "cruk_vpc_onedemobucketfive"

}

variable "iam_members" {
  type = list(object({
    role   = string
    member = string
  }))
  description = "The list of IAM members to grant permissions on the bucket"
  default = [{
    role   = "roles/storage.admin"
    member = "sharon.devaraj@accenture.com"
  }]

}