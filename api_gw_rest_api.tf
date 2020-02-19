resource "aws_api_gateway_rest_api" "rest_api" {
  name                     = "apgw-${var.region_id}-${var.environment}-${var.cost_centre}-${var.app_service}-${var.seq_id}"
  description              = var.api_description
  binary_media_types       = var.binary_media_types
  minimum_compression_size = var.minimum_compression_size
  api_key_source           = var.api_key_source
  #policy                   = "${file("${path.root}/${var.policy_file_location}")}"
  policy = "${data.template_file.init.rendered}"


  endpoint_configuration {
    types            = var.end_point_type
    vpc_endpoint_ids = var.vpc_endpoint_ids
  }
  tags = merge(
    var.common_tags,
    var.tag_for_api_gw_rest_api,
    {
      Name        = "apgw-${var.region_id}-${var.environment}-${var.cost_centre}-${var.app_service}-${var.seq_id}"
      RegionId    = "${var.region_id}"
      Environment = "${var.environment}"
      CostCentre  = "${var.cost_centre}"
      VersionId   = "${var.version_id}" # this is indication of version. for each change it is better to incr this value
      BuildDate   = "${var.build_date}"
      AppService  = "${var.app_service}"
      AppRole     = "network"

    }
  )
}

