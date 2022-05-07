output "sb_id" {
  description = "The ServiceBus Namespace ID"
  value       = azurerm_servicebus_namespace.servicebus[*].id
}

output "sb_name" {
  description = "The ServiceBus Namespace Name"
  value       = azurerm_servicebus_namespace.servicebus[*].name
}

output "sb_location" {
  description = "The ServiceBus Namespace Location"
  value       = azurerm_servicebus_namespace.servicebus[*].location
}

output "sb_topic_ids" {
  description = "The ServiceBus Topics Ids"
  value       = values(azurerm_servicebus_topic.servicebus_topic)[*].id
}

output "sb_topic_names" {
  description = "The ServiceBus Topics Names"
  value       = values(azurerm_servicebus_topic.servicebus_topic)[*].name
}

output "sb_subscription_ids" {
  description = "The ServiceBus Subscription Ids"
  value       = values(azurerm_servicebus_subscription.servicebus_subscription)[*].id
}
output "sb_subscription_names" {
  description = "The ServiceBus Subscription Names"
  value       = values(azurerm_servicebus_subscription.servicebus_subscription)[*].name
}
