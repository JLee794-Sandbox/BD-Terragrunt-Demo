resource "azurerm_servicebus_topic" "servicebus_topic" {
  for_each            = toset(var.servicebus_topic_names)
  name                = each.value
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_servicebus_namespace.servicebus[0].name

  status                                  = var.servicebus_topic_status
  default_message_ttl                     = var.servicebus_topic_default_message_ttl
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  enable_batched_operations               = var.servicebus_topic_enable_batched_operations
  enable_express                          = var.enable_express
  enable_partitioning                     = var.sku == "Premium" ? var.enable_partitioning : true
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  support_ordering                        = var.support_ordering
}


resource "azurerm_servicebus_topic_authorization_rule" "servicebus_topic_authorization_rule" {
  for_each            = toset(var.servicebus_topic_names)
  name                = lower(join("", ["sbtar", var.short_name, "${each.value}"]))
  namespace_name      = azurerm_servicebus_namespace.servicebus[0].name
  topic_name          = each.value
  resource_group_name = var.resource_group_name
  listen              = var.manage == "true" ? "true" : var.listen
  send                = var.manage == "true" ? "true" : var.send
  manage              = var.manage

  depends_on = [
    azurerm_servicebus_topic.servicebus_topic
  ]
}
