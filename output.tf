output "id" {
  value = "${aws_api_gateway_rest_api.rest_api.id}"
}

output "execution_arn" {
  value = "${aws_api_gateway_rest_api.rest_api.execution_arn}"
}

output "arn" {
  value = "${aws_api_gateway_rest_api.rest_api.arn}"
}

output "vpc_link_id" {
  value = "${aws_api_gateway_vpc_link.main[0].id}"
}

output "root_resource_id"{
  value=aws_api_gateway_rest_api.rest_api.root_resource_id
}