terraform {
  backend "local" {
    path = "/../../tfstate/terraform-aws-api-gateway/examples/tfstate.tfstate"
  }
}