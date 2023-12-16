variable "application_container" {
  description = "The application that is being run by the service"
  type        = any
}

variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "assign_public_ip" {
  description = "Assigned public IP to the container."
  type        = bool
  default     = false
}

variable "cpu" {
  description = "The amount of cores that are required for the service"
  type        = number
  default     = 256
}

variable "deployment_maximum_percent" {
  default     = 200
  type        = number
  description = "The upper limit of the number of running tasks that can be running in a service during a deployment"
}

variable "deployment_minimum_healthy_percent" {
  default     = 50
  type        = number
  description = "The lower limit of the number of running tasks that must remain running and healthy in a service during a deployment"
}

variable "desired_count" {
  description = "The number of instances of the task definitions to place and keep running."
  type        = number
  default     = 1
}

variable "ecs_cluster_id" {
  description = "The Amazon Resource Name (ARN) that identifies the ECS cluster."
  type        = string
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers."
  type        = number
  default     = 300
}

variable "lb_deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  type        = number
  default     = null
}

variable "lb_health_check" {
  description = "Health checks to verify that the container is running properly"
  type        = any
  default     = {}
}

variable "lb_listeners" {
  description = "Configuration for load balancing. Note: each condition needs to be wrapped in a separate block"
  type = list(object({
    listener_arn      = string
    security_group_id = string

    conditions = list(object({
      path_pattern = optional(string)
      host_header  = optional(string)
      http_header = optional(object({
        name   = string
        values = list(string)
      }))
    }))
  }))
  default = []
}

variable "log_retention_in_days" {
  description = "Number of days the logs will be retained in CloudWatch."
  type        = number
  default     = 30
}

variable "memory" {
  description = "The amount of memory that is required for the service"
  type        = number
  default     = 512
}

variable "private_subnet_ids" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "propagate_tags" {
  description = "Whether to propagate tags from the service or the task definition to the tasks. Valid values are SERVICE, TASK_DEFINITION or NONE"
  type        = string
  default     = "SERVICE"
}

variable "sidecar_containers" {
  description = "Sidecars for the main application"
  type        = any
  default     = []
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "wait_for_steady_state" {
  description = "Whether to wait for the ECS service to reach a steady state."
  type        = bool
  default     = false
}
