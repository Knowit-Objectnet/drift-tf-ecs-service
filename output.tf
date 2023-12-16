output "task_role_arn" {
  description = "The ARN of the task role"
  value       = aws_iam_role.task_role.arn
}

output "task_role_name" {
  description = "The name of the task role"
  value       = aws_iam_role.task_role.name
}

output "service_sg_id" {
  description = "The ID of the security group for the service."
  value       = aws_security_group.ecs_service.id
}
