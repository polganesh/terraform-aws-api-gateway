variable "end_point_type" {
  description = "it can be EDGE, REGIONAL or PRIVATE"
  type        = list
  default     = ["EDGE"]
}

variable "region_id" {
  default = "euw1"
}
variable "region" {
  description = "region in which resource will be get created."
  default     = "eu-west-1"
}

variable "environment" {
  description = "indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
  default     = "dev"
}

variable "cost_centre" {
  description = "A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
  default     = "na"
}

variable "seq_id" {
  default = "001"
}

variable "api_description" {
  default = "api created with the help of terraform"
}

variable "binary_media_types" {
  type        = list
  default     = ["UTF-8-encoded"]
  description = "The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
}

variable "minimum_compression_size" {
  type        = number
  default     = -1
  description = "Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
}

variable "api_key_source" {
  type        = string
  default     = "HEADER"
  description = "The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
}

variable "version_id" {
  description = "version of this component.everytime when we are updating this component we need to increment it."
  default     = "1"
}

variable "build_date" {
  description = "date on which this component built/modified. format ddmmyyyy e.g. 27122017"
  default     = ""
}

variable "common_tags" {
  type    = "map"
  default = {}
}

variable "tag_for_api_gw_rest_api" {
  type    = "map"
  default = {}
}

variable "vpc_endpoint_ids" {
  type    = "list"
  default = []
}

variable "app_service" {
  default = ""
}

variable "policy_file_location" {
  default = ""
}


