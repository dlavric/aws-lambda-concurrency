variable "lambda_provisioned_concurrency" {
  type        = map(string)
  description = "Lambda provisioned concurrency by environment."
  default = {
    "dev" : 1,
    "staging" : 1,
    "prod" : 2,
  }
}

variable "lambda_provisioned_concurrency_max" {
  type        = map(string)
  description = "Lambda provisioned concurrency by environment."
  default = {
    "dev" : 1,
    "staging" : 1,
    "prod" : 2,
  }
}