locals {
  application_gateway_name       = lower(join("", ["agw-", var.name]))
  gateway_ip_configuration_name  = lower(join("", [local.application_gateway_name, "-ip-config"]))
  frontend_ip_configuration_name = lower(join("", [local.application_gateway_name, "-fe-ip-config"]))
  backend_address_pool_name      = lower(join("", [local.application_gateway_name, "-be-pool"]))
  trusted_root_certificate_name  = "root_cert"
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = local.application_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  zones               = var.zones
  tags                = var.tags

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_configuration_name
    subnet_id = var.gateway_ip_configuration_subnet_id
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  waf_configuration {
    enabled                  = var.waf_enabled
    file_upload_limit_mb     = 400
    firewall_mode            = var.policy_settings_mode
    max_request_body_size_kb = 128
    request_body_check       = true
    rule_set_type            = "OWASP"
    rule_set_version         = var.waf_rule_set_version
  }

  dynamic "backend_address_pool" {
    for_each = var.backend_address_pool
    content {
      name = lookup(backend_address_pool.value, "name", null)
      # fqdns = lookup(backend_address_pool.value, "fqdns", null)
    }
  }

  identity {
    identity_ids = var.identity_ids
  }

  ssl_certificate {
    name                = local.application_gateway_name
    key_vault_secret_id = var.key_vault_secret_id
  }

  ssl_certificate {
    name                = "ps-agw-grpc-cert"
    key_vault_secret_id = var.ps_key_vault_secret_id
  }

  trusted_root_certificate {
    name = local.trusted_root_certificate_name
    data = filebase64(var.trusted_root_certificate_path)
  }

  dynamic "frontend_port" {
    for_each = var.frontend_ports
    content {
      name = lookup(frontend_port.value, "name", null)
      port = lookup(frontend_port.value, "port", null)
    }
  }

  #Web
  dynamic "backend_http_settings" {
    for_each = var.backend_services
    content {
      name                  = lookup(backend_http_settings.value, "internal_host_name", null)
      host_name             = lookup(backend_http_settings.value, "host_name", lookup(backend_http_settings.value, "internal_host_name", null))
      cookie_based_affinity = lookup(backend_http_settings.value, "cookie_based_affinity", "Disabled")
      path                  = lookup(backend_http_settings.value, "path", "/")
      port                  = lookup(backend_http_settings.value, "internal_port", 443)
      protocol              = lookup(backend_http_settings.value, "internal_protocol", "HTTPS")
      request_timeout       = lookup(backend_http_settings.value, "request_timeout", 20)
      #trusted_root_certificate_names = length(regexall("['.*function.*'|'*sessionservice*']+", backend_http_settings.value.internal_host_name)) != 0 ? [] : [lookup(backend_http_settings.value, "trusted_root_certificate_names", local.trusted_root_certificate_name)]
      trusted_root_certificate_names = length(regexall("function|sessionservice|dle-neo-presentation|grafana|boot-service", backend_http_settings.value.internal_host_name)) != 0 ? [] : [lookup(backend_http_settings.value, "trusted_root_certificate_names", local.trusted_root_certificate_name)]
      probe_name                     = lookup(backend_http_settings.value, "probe_name", null)
    }
  }

  dynamic "http_listener" {
    for_each = var.backend_services
    content {
      name                           = lookup(http_listener.value, "public_host_name", null)
      host_name                      = lookup(http_listener.value, "public_host_name", null)
      frontend_ip_configuration_name = lookup(http_listener.value, "frontend_ip_configuration_name", local.frontend_ip_configuration_name)
      frontend_port_name             = lookup(http_listener.value, "frontend_port_name", null)
      protocol                       = lookup(http_listener.value, "frontend_protocol", "HTTPS")
      ssl_certificate_name           = length(regexall("sessionservice", http_listener.value.internal_host_name)) != 0 ? "ps-agw-grpc-cert" : lookup(http_listener.value, "ssl_certificate_name", local.application_gateway_name)
    }
  }
  /*
  dynamic "probe" {
    for_each = var.backend_services
    content {
      pick_host_name_from_backend_http_settings = lookup(probe.value, "pick_host_name_from_backend_http_settings", true)
      name                                      = lookup(probe.value, "internal_host_name", null)
      interval                                  = lookup(probe.value, "interval", 30)
      protocol                                  = lookup(probe.value, "internal_protocol", "Https")
      path                                      = lookup(probe.value, "probe_path", "/")
      timeout                                   = lookup(probe.value, "timeout", 30)
      unhealthy_threshold                       = lookup(probe.value, "unhealthy_threshold", 3)
    }
  }
*/
  dynamic "request_routing_rule" {
    for_each = var.backend_services
    content {
      name                       = lookup(request_routing_rule.value, "public_host_name", null)
      rule_type                  = lookup(request_routing_rule.value, "rule_type", "Basic")
      http_listener_name         = lookup(request_routing_rule.value, "public_host_name", null)
      backend_address_pool_name  = lookup(request_routing_rule.value, "backend_address_pool_name", local.backend_address_pool_name)
      backend_http_settings_name = lookup(request_routing_rule.value, "internal_host_name", null)
    }
  }

  # dynamic "probe" {
  #   for_each = var.custom_probes
  #   content {
  #     name                                      = lookup(probe.value, "name", null)
  #     interval                                  = lookup(probe.value, "interval", 30)
  #     protocol                                  = lookup(probe.value, "protocol", "Https")
  #     path                                      = lookup(probe.value, "path", "/")
  #     timeout                                   = lookup(probe.value, "timeout", 30)
  #     unhealthy_threshold                       = lookup(probe.value, "unhealthy_threshold", 3)
  #     host                                      = lookup(probe.value, "host", null)
  #     pick_host_name_from_backend_http_settings = lookup(probe.value, "pick_host_name_from_backend_http_settings", false)
  #     match {
  #       status_code = lookup(probe.value, "status_code", ["200-399"])
  #       body        = ""
  #     }
  #   }
  # }

  depends_on = [
    azurerm_network_security_rule.network_security_rule_AllowGatewayInternet,
    azurerm_network_security_rule.network_security_rule_AllowHTTPSInternet,
    azurerm_public_ip.public_ip
  ]
}
