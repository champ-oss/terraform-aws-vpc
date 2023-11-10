variable "name" {
  description = "Used to label all resources"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Additional tags to be applied to all resources"
  default     = {}
  type        = map(string)
}

variable "public_subnet_tags" {
  description = "Additional tags to be applied to public subnets"
  default     = {}
  type        = map(string)
}

variable "private_subnet_tags" {
  description = "Additional tags to be applied to private subnets"
  default     = {}
  type        = map(string)
}

variable "cidr_block" {
  description = "CIDR block to use for the VPC. By default 10.0.0.0 with a size of /16 is used."
  default     = "10.0.0.0"
  type        = string
  validation {
    # Simple regex for matching an IP address
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.cidr_block))
    error_message = "CIDR block must be a valid IP address (ex: 192.168.1.0)."
  }
}

variable "cidr_size" {
  description = "CIDR block size for the VPC. By default a /16 CIDR block is created."
  default     = 16
  type        = number
  validation {
    condition     = var.cidr_size >= 0 && var.cidr_size <= 32
    error_message = "The CIDR block size (bits) should be between 0 and 32."
  }
}

variable "subnet_size" {
  description = "How many bits to use for creating each subnet."
  default     = 4
  type        = number
  validation {
    condition     = var.subnet_size >= 0 && var.subnet_size <= 32
    error_message = "The subnet size (bits) should be between 0 and 32."
  }
}

variable "availability_zones_count" {
  description = "Number of availability zones to use when creating subnets"
  default     = 3
  type        = number
  validation {
    condition     = var.availability_zones_count <= 10
    error_message = "The number of availability zones to use should be less than 10."
  }
}

variable "retention_in_days" {
  description = "Retention period for VPC flow logs"
  type        = number
  default     = 90
}

variable "create_private_subnets" {
  description = "If disabled only public subnets will be created"
  type        = bool
  default     = true
}

variable "shared" {
  description = "Creates SSM parameters to enable discovery as a shared resource"
  type        = bool
  default     = false
}

variable "discovery_path" {
  description = "SSM path used to discover shared resources"
  type        = string
  default     = "/default/vpc"
}

variable "ipv4_ipam_pool_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#ipv4_ipam_pool_id"
  type        = string
  default     = null
}

variable "ipv4_netmask_length" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#ipv4_netmask_length"
  type        = string
  default     = null
}

variable "enable_discover_ipam" {
  description = "Use data resource to discover IPAM pool"
  type        = bool
  default     = false
}

variable "ipam_search_description" {
  description = "IPAM pool description to search"
  type        = string
  default     = "*"
}

variable "enable_transit_gateway_attachment" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment"
  type        = bool
  default     = false
}

variable "transit_gateway_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment#transit_gateway_id"
  type        = string
  default     = null
}
