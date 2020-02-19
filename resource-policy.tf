data "aws_region" "current" {}
data "aws_caller_identity" "current" {}


data "template_file" "init" {
  template = "${file("${path.root}/${var.policy_file_location}")}"
  vars = {
    current_region      = "${data.aws_region.current.name}"
    current_aws_account = "${data.aws_caller_identity.current.account_id}"
    #api_id              = "${aws_api_gateway_rest_api.rest_api.id}"
  }
}