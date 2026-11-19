variable "aws_region" {
  description = "Region for aws"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the bucket"
  type        = string

}