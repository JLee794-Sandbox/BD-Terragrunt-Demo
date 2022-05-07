 {
    "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 9,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "queryParams",
                  "value": {
                    "metricQueryId": "cpu",
                    "clusterName": "${clusterName}",
                    "clusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "workspaceResourceId": "${workspace_id}",
                    "timeRange": {
                      "options": {},
                      "relative": {
                        "duration": 21600000
                      }
                    }
                  }
                },
                {
                  "name": "bladeName",
                  "value": "SingleCluster.ReactView"
                },
                {
                  "name": "extensionName",
                  "value": "Microsoft_Azure_Monitoring"
                },
                {
                  "name": "bladeParams",
                  "value": {
                    "armClusterPath": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "armWorkspacePath": "${workspace_id}",
                    "clusterRegion": "eastus",
                    "initiator": "ManagedClusterAsset.getMenuConfig",
                    "containerClusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "containerClusterName": "${clusterName}",
                    "workspaceResourceId": "${workspace_id}"
                  }
                },
                {
                  "name": "defaultOptionPicks",
                  "value": [
                    {
                      "id": "Avg",
                      "displayName": "Avg",
                      "isSelected": true
                    },
                    {
                      "id": "Min",
                      "displayName": "Min",
                      "isSelected": false
                    },
                    {
                      "id": "P50",
                      "displayName": "50th",
                      "isSelected": false
                    },
                    {
                      "id": "P90",
                      "displayName": "90th",
                      "isSelected": false
                    },
                    {
                      "id": "P95",
                      "displayName": "95th",
                      "isSelected": false
                    },
                    {
                      "id": "Max",
                      "displayName": "Max",
                      "isSelected": true
                    }
                  ]
                },
                {
                  "name": "showOptionPicker",
                  "value": true
                }
              ],
              "type": "Extension/Microsoft_Azure_Monitoring/PartType/ChartPart"
            }
          },
          "1": {
            "position": {
              "x": 9,
              "y": 0,
              "colSpan": 10,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "queryParams",
                  "value": {
                    "metricQueryId": "memory",
                    "clusterName": "${clusterName}",
                    "clusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "workspaceResourceId": "${workspace_id}",
                    "timeRange": {
                      "options": {},
                      "relative": {
                        "duration": 21600000
                      }
                    }
                  }
                },
                {
                  "name": "bladeName",
                  "value": "SingleCluster.ReactView"
                },
                {
                  "name": "extensionName",
                  "value": "Microsoft_Azure_Monitoring"
                },
                {
                  "name": "bladeParams",
                  "value": {
                    "armClusterPath": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "armWorkspacePath": "${workspace_id}",
                    "clusterRegion": "eastus",
                    "initiator": "ManagedClusterAsset.getMenuConfig",
                    "containerClusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "containerClusterName": "${clusterName}",
                    "workspaceResourceId": "${workspace_id}"
                  }
                },
                {
                  "name": "defaultOptionPicks",
                  "value": [
                    {
                      "id": "Avg",
                      "displayName": "Avg",
                      "isSelected": true
                    },
                    {
                      "id": "Min",
                      "displayName": "Min",
                      "isSelected": false
                    },
                    {
                      "id": "P50",
                      "displayName": "50th",
                      "isSelected": false
                    },
                    {
                      "id": "P90",
                      "displayName": "90th",
                      "isSelected": false
                    },
                    {
                      "id": "P95",
                      "displayName": "95th",
                      "isSelected": false
                    },
                    {
                      "id": "Max",
                      "displayName": "Max",
                      "isSelected": true
                    }
                  ]
                },
                {
                  "name": "showOptionPicker",
                  "value": true
                }
              ],
              "type": "Extension/Microsoft_Azure_Monitoring/PartType/ChartPart"
            }
          },
          "2": {
            "position": {
              "x": 0,
              "y": 4,
              "colSpan": 6,
              "rowSpan": 3
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                  "isOptional": true
                },
                {
                  "name": "TimeContext",
                  "value": null,
                  "isOptional": true
                },
                {
                  "name": "ResourceIds",
                  "value": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ],
                  "isOptional": true
                },
                {
                  "name": "ConfigurationId",
                  "value": "Community-Workbooks/AKS/Deployments and HPAs",
                  "isOptional": true
                },
                {
                  "name": "Type",
                  "value": "container-insights",
                  "isOptional": true
                },
                {
                  "name": "GalleryResourceType",
                  "value": "microsoft.containerservice/managedclusters",
                  "isOptional": true
                },
                {
                  "name": "PinName",
                  "value": "Deployments",
                  "isOptional": true
                },
                {
                  "name": "StepSettings",
                  "value": "{\"version\":\"KqlItem/1.0\",\"query\":\"InsightsMetrics\\r\\n| where Name == \\\"kube_deployment_status_replicas_ready\\\"\\r\\n| extend parsed = parse_json(Tags)\\r\\n| where parsed.deployment in ({deploymentName})\\r\\n| extend Deployment = tostring(parsed.deployment)\\r\\n| extend Ready = Val/parsed.spec_replicas * 100, Updated = Val/parsed.status_replicas_updated * 100, Available = Val/parsed.status_replicas_available * 100\\r\\n| extend ReadyCase = case(Ready == 100, \\\"Healthy\\\", \\\"Warning\\\"),  UpdatedCase = case(Updated == 100, \\\"Healthy\\\", \\\"Warning\\\"),  AvailableCase = case(Available == 100, \\\"Healthy\\\", \\\"Warning\\\")\\r\\n| extend Overall = case(ReadyCase == \\\"Healthy\\\" and UpdatedCase == \\\"Healthy\\\" and AvailableCase == \\\"Healthy\\\", \\\"Healthy\\\", \\\"Warning\\\")\\r\\n| summarize arg_max(TimeGenerated, *) by Deployment\\r\\n| summarize OverallStatus = count() by Overall\",\"size\":3,\"title\":\"Deployment Status\",\"timeContext\":{\"durationMs\":86400000},\"exportParameterName\":\"OverallFilter\",\"exportDefaultValue\":\"*\",\"queryType\":0,\"resourceType\":\"{resourceType}\",\"crossComponentResources\":[\"{resource}\"],\"visualization\":\"tiles\",\"tileSettings\":{\"titleContent\":{\"columnMatch\":\"Overall\",\"formatter\":18,\"formatOptions\":{\"thresholdsOptions\":\"colors\",\"thresholdsGrid\":[{\"operator\":\"==\",\"thresholdValue\":\"Warning\",\"representation\":\"redBright\",\"text\":\"{0}{1}\"},{\"operator\":\"Default\",\"thresholdValue\":null,\"representation\":\"green\",\"text\":\"{0}{1}\"}]}},\"leftContent\":{\"columnMatch\":\"OverallStatus\",\"formatter\":12,\"formatOptions\":{\"palette\":\"none\"},\"numberFormat\":{\"unit\":17,\"options\":{\"style\":\"decimal\",\"useGrouping\":false,\"maximumFractionDigits\":2,\"maximumSignificantDigits\":3}}},\"showBorder\":false,\"sortCriteriaField\":\"Overall\",\"sortOrderField\":2}}",
                  "isOptional": true
                },
                {
                  "name": "ParameterValues",
                  "value": {
                    "timeRange": {
                      "type": 4,
                      "value": {
                        "durationMs": 21600000
                      },
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "Last 6 hours",
                      "displayName": "Time Range",
                      "formattedValue": "Last 6 hours"
                    },
                    "resource": {
                      "type": 5,
                      "value": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "Any one",
                      "displayName": "resource",
                      "specialValue": "value::1",
                      "formattedValue": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                    },
                    "resourceType": {
                      "type": 7,
                      "value": "microsoft.containerservice/managedclusters",
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "Any one",
                      "displayName": "resourceType",
                      "specialValue": "value::1",
                      "formattedValue": "microsoft.containerservice/managedclusters"
                    },
                    "clusterId": {
                      "type": 1,
                      "value": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                      "displayName": "clusterId",
                      "formattedValue": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                    },
                    "clusterIdWhereClause": {
                      "type": 1,
                      "value": "| where \"a\" == \"a\"",
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "| where \"a\" == \"a\"",
                      "displayName": "clusterIdWhereClause",
                      "formattedValue": "| where \"a\" == \"a\""
                    },
                    "namespace": {
                      "type": 2,
                      "value": [
                        "dev"
                      ],
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "dev",
                      "displayName": "Namespace",
                      "formattedValue": "'dev'"
                    },
                    "deploymentName": {
                      "type": 2,
                      "value": [
                        "freddy-uis-freddy",
                        "dev-uis-web",
                        "dev-uis-provisioning-client",
                        "dev-uis-presentation-api",
                        "dev-uis-mas",
                        "dev-uis-maintenance-tool-processor",
                        "dev-uis-maintenance-tool",
                        "dev-uis-dle",
                        "dev-uis-device-hub",
                        "dev-uis-device-event-processor",
                        "dev-uis-cce-outbound",
                        "dev-uis-badger",
                        "dev-uis-device-adapter",
                        "dev-uis-dm"
                      ],
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "All",
                      "displayName": "Deployment",
                      "specialValue": [
                        "value::all"
                      ],
                      "formattedValue": "'freddy-uis-freddy','dev-uis-web','dev-uis-provisioning-client','dev-uis-presentation-api','dev-uis-mas','dev-uis-maintenance-tool-processor','dev-uis-maintenance-tool','dev-uis-dle','dev-uis-device-hub','dev-uis-device-event-processor','dev-uis-cce-outbound','dev-uis-badger','dev-uis-device-adapter','dev-uis-dm'"
                    },
                    "hpa": {
                      "type": 2,
                      "value": [],
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "All",
                      "displayName": "HPA",
                      "specialValue": [
                        "value::all"
                      ],
                      "formattedValue": null
                    },
                    "selectedTab": {
                      "type": 1,
                      "value": "Deployment",
                      "formattedValue": "Deployment"
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "Location",
                  "isOptional": true
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/PinnedNotebookQueryPart"
            }
          },
          "3": {
            "position": {
              "x": 6,
              "y": 4,
              "colSpan": 13,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "queryParams",
                  "value": {
                    "metricQueryId": "pod-count",
                    "clusterName": "${clusterName}",
                    "clusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "workspaceResourceId": "${workspace_id}",
                    "timeRange": {
                      "options": {},
                      "relative": {
                        "duration": 21600000
                      }
                    }
                  }
                },
                {
                  "name": "bladeName",
                  "value": "SingleCluster.ReactView"
                },
                {
                  "name": "extensionName",
                  "value": "Microsoft_Azure_Monitoring"
                },
                {
                  "name": "bladeParams",
                  "value": {
                    "armClusterPath": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "armWorkspacePath": "${workspace_id}",
                    "clusterRegion": "eastus",
                    "initiator": "ManagedClusterAsset.getMenuConfig",
                    "containerClusterResourceId": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}",
                    "containerClusterName": "${clusterName}",
                    "workspaceResourceId": "${workspace_id}"
                  }
                },
                {
                  "name": "defaultOptionPicks",
                  "value": [
                    {
                      "id": "all",
                      "displayName": "Total",
                      "isSelected": false
                    },
                    {
                      "id": "pending",
                      "displayName": "Pending",
                      "isSelected": true
                    },
                    {
                      "id": "running",
                      "displayName": "Running",
                      "isSelected": true
                    },
                    {
                      "id": "unknown",
                      "displayName": "Unknown",
                      "isSelected": true
                    },
                    {
                      "id": "succeeded",
                      "displayName": "Succeeded",
                      "isSelected": true
                    },
                    {
                      "id": "failed",
                      "displayName": "Failed",
                      "isSelected": true
                    },
                    {
                      "id": "terminating",
                      "displayName": "Terminating",
                      "isSelected": true
                    }
                  ]
                },
                {
                  "name": "showOptionPicker",
                  "value": true
                }
              ],
              "type": "Extension/Microsoft_Azure_Monitoring/PartType/ChartPart"
            }
          },
          "4": {
            "position": {
              "x": 0,
              "y": 7,
              "colSpan": 6,
              "rowSpan": 5
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Cache/Redis/${redis_name}",
                  "isOptional": true
                },
                {
                  "name": "TimeContext",
                  "value": null,
                  "isOptional": true
                },
                {
                  "name": "ResourceIds",
                  "isOptional": true
                },
                {
                  "name": "ConfigurationId",
                  "value": "Community-Workbooks/Resource Insights/RedisCache",
                  "isOptional": true
                },
                {
                  "name": "Type",
                  "value": "rediscache-insights",
                  "isOptional": true
                },
                {
                  "name": "GalleryResourceType",
                  "value": "microsoft.cache/redis",
                  "isOptional": true
                },
                {
                  "name": "PinName",
                  "value": "",
                  "isOptional": true
                },
                {
                  "name": "StepSettings",
                  "value": "{\"chartId\":\"workbook7b475670-4421-486e-b158-a46da04ba378\",\"version\":\"MetricsItem/2.0\",\"size\":4,\"chartType\":-1,\"resourceType\":\"microsoft.cache/redis\",\"metricScope\":0,\"resourceParameter\":\"Resource\",\"resourceIds\":[\"{Resource}\"],\"timeContextFromParameter\":\"TimeRange\",\"timeContext\":{\"durationMs\":14400000},\"metrics\":[{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--serverLoad\",\"aggregation\":3},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--percentProcessorTime\",\"aggregation\":3},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--usedmemory\",\"aggregation\":3},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--connectedclients\",\"aggregation\":3},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--errors\",\"aggregation\":4},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--expiredkeys\",\"aggregation\":3},{\"namespace\":\"microsoft.cache/redis\",\"metric\":\"microsoft.cache/redis--evictedkeys\",\"aggregation\":3}],\"gridFormatType\":1,\"tileSettings\":{\"titleContent\":{\"columnMatch\":\"Metric\",\"formatter\":13,\"formatOptions\":{\"linkTarget\":null,\"showIcon\":false}},\"leftContent\":{\"columnMatch\":\"Value\",\"formatter\":12,\"formatOptions\":{\"palette\":\"auto\"},\"numberFormat\":{\"unit\":17,\"options\":{\"maximumSignificantDigits\":3,\"maximumFractionDigits\":2}}},\"secondaryContent\":{\"columnMatch\":\"Timeline\",\"formatter\":9},\"showBorder\":false,\"size\":\"auto\"},\"gridSettings\":{\"rowLimit\":10000}}",
                  "isOptional": true
                },
                {
                  "name": "ParameterValues",
                  "value": {
                    "Resource": {
                      "type": 5,
                      "value": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Cache/Redis/${redis_name}",
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "Any one",
                      "displayName": "Redis Cache",
                      "specialValue": "value::1",
                      "formattedValue": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Cache/Redis/${redis_name}"
                    },
                    "TimeRange": {
                      "type": 4,
                      "value": {
                        "durationMs": 14400000
                      },
                      "isPending": false,
                      "isWaiting": false,
                      "isFailed": false,
                      "isGlobal": false,
                      "labelValue": "Last 4 hours",
                      "displayName": "Time Range",
                      "formattedValue": "Last 4 hours"
                    },
                    "tab": {
                      "type": 1,
                      "value": "overview",
                      "formattedValue": "overview"
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "Location",
                  "isOptional": true
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/PinnedNotebookMetricsPart"
            }
          },
          "5": {
            "position": {
              "x": 6,
              "y": 8,
              "colSpan": 4,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "TotalRequests",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Total Requests",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Total Requests",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {
                "content": {
                  "options": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "TotalRequests",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Total Requests",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Total Requests",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2,
                        "disablePinning": true
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  }
                }
              },
              "filters": {
                "MsPortalFx_TimeRange": {
                  "model": {
                    "format": "local",
                    "granularity": "auto",
                    "relative": "60m"
                  }
                }
              }
            }
          },
          "6": {
            "position": {
              "x": 10,
              "y": 8,
              "colSpan": 4,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "ResponseStatus",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Response Status",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Response Status by HttpStatus",
                      "titleKind": 2,
                      "grouping": {
                        "dimension": "HttpStatusGroup"
                      },
                      "visualization": {
                        "chartType": 2
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {
                "content": {
                  "options": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "ResponseStatus",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Response Status",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Response Status by HttpStatus",
                      "titleKind": 2,
                      "grouping": {
                        "dimension": "HttpStatusGroup"
                      },
                      "visualization": {
                        "chartType": 2,
                        "disablePinning": true
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  }
                }
              },
              "filters": {
                "MsPortalFx_TimeRange": {
                  "model": {
                    "format": "local",
                    "granularity": "auto",
                    "relative": "60m"
                  }
                }
              }
            }
          },
          "7": {
            "position": {
              "x": 14,
              "y": 8,
              "colSpan": 5,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "FailedRequests",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Failed Requests",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Failed Requests",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {
                "content": {
                  "options": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Network/applicationGateways/${app_gateway_name}"
                          },
                          "name": "FailedRequests",
                          "aggregationType": 1,
                          "metricVisualization": {
                            "displayName": "Failed Requests",
                            "resourceDisplayName": "${app_gateway_name}"
                          }
                        }
                      ],
                      "title": "Sum Failed Requests",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2,
                        "disablePinning": true
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  }
                }
              },
              "filters": {
                "MsPortalFx_TimeRange": {
                  "model": {
                    "format": "local",
                    "granularity": "auto",
                    "relative": "60m"
                  }
                }
              }
            }
          },
          "8": {
            "position": {
              "x": 0,
              "y": 12,
              "colSpan": 6,
              "rowSpan": 5
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "cpu_percent",
                          "aggregationType": 4,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "CPU percentage"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "storage_percent",
                          "aggregationType": 3,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "Data space used percent"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "storage_percent",
                          "aggregationType": 3,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "Data space used percent"
                          }
                        }
                      ],
                      "title": "Avg CPU percentage, Max Data space used percent, and Max Data space used percent for ${database_name}",
                      "titleKind": 1,
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "timespan": {
                        "relative": {
                          "duration": 86400000
                        },
                        "showUTCTime": false,
                        "grain": 1
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {
                "content": {
                  "options": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "cpu_percent",
                          "aggregationType": 4,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "CPU percentage"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "storage_percent",
                          "aggregationType": 3,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "Data space used percent"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.Sql/servers/${database_server_name}/databases/${database_name}"
                          },
                          "name": "storage_percent",
                          "aggregationType": 3,
                          "namespace": "microsoft.sql/servers/databases",
                          "metricVisualization": {
                            "displayName": "Data space used percent"
                          }
                        }
                      ],
                      "title": "Avg CPU percentage, Max Data space used percent, and Max Data space used percent for ${database_name}",
                      "titleKind": 1,
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        },
                        "disablePinning": true
                      }
                    }
                  }
                }
              },
              "filters": {
                "MsPortalFx_TimeRange": {
                  "model": {
                    "format": "local",
                    "granularity": "auto",
                    "relative": "1440m"
                  }
                }
              }
            }
          },
          "9": {
            "position": {
              "x": 0,
              "y": 17,
              "colSpan": 2,
              "rowSpan": 2
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "\n <a href='https://dev.uis.bdservices.io' > <img width='100' src='https://www.bd.com/assets/images/logos/bd-griffin.png'/></a> \n",
                    "title": "dev.uis.bdservices.io",
                    "subtitle": "application",
                    "markdownSource": 1
                  }
                }
              }
            }
          }
        }
      }
    }
  }
