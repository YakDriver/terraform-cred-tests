output "current_user" {
  value = "${data.aws_caller_identity.new_role.arn}"
}
