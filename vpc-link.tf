resource "aws_api_gateway_vpc_link" "main" {
  count       = "${var.is_create_vpc_link == "true" ? 1 : 0}"
  name        = "vlnk-${var.region_id}-${var.environment}-${var.cost_centre}-${var.app_service}-${var.seq_id}"
  description = var.vlink_description
  #reference of load balancers
  target_arns = var.vlink_target_lb_arns_list

  tags = merge(
    var.common_tags,
    var.tag_for_vpc_link,
    {
      Name        = "vlnk-${var.region_id}-${var.environment}-${var.cost_centre}-${var.app_service}-${var.seq_id}"
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