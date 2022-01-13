# data "terraform_remote_state" "vpc" {
#   backend = "remote"

#   config = {
#     organization = "hashicorp"
#     workspaces = {
#       name = "vpc-prod"
#     }
#   }
# }

# # Terraform >= 0.12
# resource "aws_instance" "foo" {
#   # ...
#   subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
# }

# # Terraform <= 0.11
# resource "aws_instance" "foo" {
#   # ...
#   subnet_id = "${data.terraform_remote_state.vpc.subnet_id}"
# }
