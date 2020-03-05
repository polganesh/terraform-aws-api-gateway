data "template_file" "init" {
  template = "${file("${path.root}/${var.policy_file_location}")}"
  vars = {
    current_region      = "${data.aws_region.current.name}"
    current_aws_account = "${data.aws_caller_identity.current.account_id}"
  }
}