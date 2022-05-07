resource "azurerm_servicebus_subscription" "servicebus_subscription" {
  for_each                                  = toset(var.servicebus_topic_names)
  name                                      = "all"
  resource_group_name                       = var.resource_group_name
  namespace_name                            = azurerm_servicebus_namespace.servicebus[0].name
  topic_name                                = each.value
  status                                    = var.servicebus_subscription_status
  max_delivery_count                        = var.max_delivery_count
  default_message_ttl                       = var.servicebus_subscription_default_message_ttl
  lock_duration                             = var.lock_duration
  dead_lettering_on_message_expiration      = var.dead_lettering_on_message_expiration
  dead_lettering_on_filter_evaluation_error = var.dead_lettering_on_filter_evaluation_error
  enable_batched_operations                 = var.servicebus_subscription_enable_batched_operations
  requires_session                          = var.requires_session
  forward_to                                = var.forward_to
  forward_dead_lettered_messages_to         = var.forward_dead_lettered_messages_to

  depends_on = [
    azurerm_servicebus_topic.servicebus_topic
  ]
}
