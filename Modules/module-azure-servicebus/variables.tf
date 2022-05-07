variable "name" {
  description = "Service Bus name"
}

variable "short_name" {
  description = "Service Bus short name"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Service Bus location -	westeurope/eastus"
}

variable "tags" {
  description = "A mapping of tags to assign to Service Bus"
  default     = {}
}


variable "sku" {
  default     = "Standard"
  description = "Defines which tier to use. Options are basic, standard or premium. Changing this forces a new resource to be created."
}

variable "capacity" {
  type        = string
  default     = "1"
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."

  validation {
    condition     = contains(["1", "2", "4", "8", "16"], var.capacity)
    error_message = "Valid values for var: capacity are (1, 2, 4 , 8, 16)."
  }
}


variable "zone_redundant" {
  default     = false
  description = "Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false."
}


variable "servicebus_topic_names" {
  description = "A list of topics name"
  type        = list(string)
  default     = []
}

variable "enable_partitioning" {
  default     = false
  description = "Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false."
}

variable "servicebus_topic_status" {
  default     = "Active"
  description = "The Status of the Service Bus Topic. Acceptable values are Active or Disabled. Defaults to Active."
}

variable "servicebus_topic_default_message_ttl" {
  default     = "PT5M"
  description = "The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself."
}

variable "duplicate_detection_history_time_window" {
  default     = "PT10M"
  description = " The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes."
}

variable "servicebus_topic_enable_batched_operations" {
  default     = "false"
  description = "Boolean flag which controls if server-side batched operations are enabled. Defaults to false."
}

variable "enable_express" {
  default     = "false"
  description = "Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false."
}

variable "max_size_in_megabytes" {
  default     = "1024"
  description = "integer value which controls the size of memory allocated for the topic."
}

variable "requires_duplicate_detection" {
  default     = "false"
  description = "Boolean flag which controls whether the Topic requires duplicate detection. Defaults to false. Changing this forces a new resource to be created."
}

variable "support_ordering" {
  default     = "false"
  description = "Boolean flag which controls whether the Topic supports ordering. Defaults to false."
}


variable "listen" {
  default     = "true"
  description = "Grants listen access to this this Authorization Rule. Defaults to false"
}


variable "manage" {
  default     = "false"
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false."
}


variable "send" {
  default     = "false"
  description = "Grants send access to this this Authorization Rule. Defaults to false"
}

variable "sb_ip_whitelist" {
  description = "SQL ip whitelist addresses"
  default     = "0.0.0.0"
}


variable "subnet_id" {
  description = "The ID of the subnet that the Service Bus server will be connected to."
}


variable "servicebus_subscription_default_message_ttl" {
  default     = "PT5M"
  description = "The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself."
}


variable "servicebus_subscription_status" {
  default     = "Active"
  description = "The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active."
}

variable "lock_duration" {
  default     = "PT1M"
  description = "The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or PT1M."
}

variable "dead_lettering_on_message_expiration" {
  default     = "false"
  description = "Boolean flag which controls whether the Subscription has dead letter support when a message expires. Defaults to false."
}

variable "dead_lettering_on_filter_evaluation_error" {
  default     = "true"
  description = "Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true."
}

variable "servicebus_subscription_enable_batched_operations" {
  default     = "true"
  description = "Boolean flag which controls whether the Subscription supports batched operations. Defaults to false."
}

variable "requires_session" {
  default     = "true"
  description = "Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created."
}


variable "forward_to" {
  default     = ""
  description = "The name of a Queue or Topic to automatically forward messages to."
}

variable "forward_dead_lettered_messages_to" {
  default     = ""
  description = "The name of a Queue or Topic to automatically forward Dead Letter messages to."
}

variable "max_delivery_count" {
  default     = "1"
  description = "The maximum number of deliveries."
}

variable "ignore_missing_vnet_service_endpoint" {
  default     = "false"
  description = " Should the ServiceBus Namespace Network Rule Set ignore missing Virtual Network Service Endpoint option in the Subnet? Defaults to false."
}

variable "create_servicebus" {
  default     = true
  description = "Create ServiceBus"
}
