variable "vpc_subnets" {
  description = "List of subnets defined in VPC"
  type        = map
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "nodes_desired_size" {
  description = "Amount of K8s nodes in EKS cluster"
  type        = number
  default     = 1
}

variable "nodes_max_size" {
  description = "Max amount of K8s nodes in EKS cluster"
  type        = number
  default     = 1
}

variable "nodes_min_size" {
  description = "Min amount of K8s nodes in EKS cluster"
  type        = number
  default     = 1
}
