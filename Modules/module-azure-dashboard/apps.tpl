{
  "lenses": {
    "0": {
      "order": 0,
      "parts": {
        "0": {
          "position": {
            "x": 0,
            "y": 0,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "14cd3c11-13c9-413c-86e7-33d50c314d65",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar ( KubePodInventory | where ControllerName contains \"uis-device-adapter\" | sort by TimeGenerated | take 1 | distinct ControllerName );\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-device-adapter"
              }
            }
          }
        },
        "1": {
          "position": {
            "x": 5,
            "y": 0,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "98800e8a-1e3e-422b-9612-14ae9dc0314e",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT60M",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-device-adapter\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-device-adapter"
              }
            }
          }
        },
        "2": {
          "position": {
            "x": 9,
            "y": 0,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "154e08b6-6177-4c9f-8714-22552e27b158",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-device-adapter\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "705px",
                  "timestamp": "168px"
                },
                "PartSubTitle": "Container log",
                "PartTitle": "uis-device-adapter",
                "Query": "ContainerLog\n| where TimeGenerated > ago (20m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-device-adapter\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "3": {
          "position": {
            "x": 0,
            "y": 4,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "6c9c7214-b5a7-4659-8235-ee0d415959f0",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-cce-outbound\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-cce-outbound"
              }
            }
          }
        },
        "4": {
          "position": {
            "x": 5,
            "y": 4,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "571ec743-0ba7-40b9-a926-02fbb0c20c90",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-cce-outbound\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory Utilization",
                "PartTitle": "uis-cce-outbound"
              }
            }
          }
        },
        "5": {
          "position": {
            "x": 9,
            "y": 4,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1058716e-78d9-444f-a452-bc2b35140dbc",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-cce-outbound\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "670px"
                },
                "PartSubTitle": "container-log",
                "PartTitle": "uis-cce-outbound",
                "Query": "ContainerLog\n| where TimeGenerated > ago (200m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-cce-outbound\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "6": {
          "position": {
            "x": 0,
            "y": 8,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "138f5a02-146e-492d-a7b1-5276c42008be",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-device-hub\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-device-hub"
              }
            }
          }
        },
        "7": {
          "position": {
            "x": 5,
            "y": 8,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1477c44e-153e-4113-8817-73bbadd10f24",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-device-hub\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory Utilization",
                "PartTitle": "uis-device-hub"
              }
            }
          }
        },
        "8": {
          "position": {
            "x": 9,
            "y": 8,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1b585a5e-0967-45c7-a771-a132211e7cc6",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (2000m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-device-hub\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "693px"
                },
                "PartSubTitle": "container-log",
                "PartTitle": "uis-device-hub"
              }
            },
            "filters": {
              "MsPortalFx_TimeRange": {
                "model": {
                  "format": "utc",
                  "granularity": "auto",
                  "relative": "7d"
                }
              }
            }
          }
        },
        "9": {
          "position": {
            "x": 0,
            "y": 12,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "72807dab-2ddd-4f6b-8f97-18a5df649fe4",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-dm\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-dm"
              }
            }
          }
        },
        "10": {
          "position": {
            "x": 5,
            "y": 12,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "4388851d-0edf-4314-b014-2cf85f280fff",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT1H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-dm\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory Utilization",
                "PartTitle": "uis-dm"
              }
            }
          }
        },
        "11": {
          "position": {
            "x": 9,
            "y": 12,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "7032063d-3fd1-42f9-b863-ff8c1c11192c",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-dm\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "726px"
                },
                "PartSubTitle": "Container-logs",
                "PartTitle": "uis-dm",
                "Query": "ContainerLog\n| where TimeGenerated > ago (200m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-dm\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "12": {
          "position": {
            "x": 0,
            "y": 16,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "60dbbe8d-0f08-40b7-a9fa-290fd801d160",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-maintenance-tool\" and not(ControllerName contains \"uis-maintenance-tool-processor\")\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-maintenance-tool"
              }
            }
          }
        },
        "13": {
          "position": {
            "x": 5,
            "y": 16,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "82554301-913b-420f-b147-74b37813c447",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-maintenance-tool\" and not( ControllerName contains \"uis-maintenance-tool-processor\")\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-maintenance-tool"
              }
            }
          }
        },
        "14": {
          "position": {
            "x": 9,
            "y": 16,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "96a36bb4-1227-4f62-9055-9c25c2fb48ba",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-maintenance-tool\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "711px"
                },
                "PartSubTitle": "Container logs",
                "PartTitle": "dev-uis-maintenance-tool",
                "Query": "ContainerLog\n| where TimeGenerated > ago (200m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-maintenance-tool\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "15": {
          "position": {
            "x": 0,
            "y": 20,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "12ca2361-1165-4b76-aa47-68afa8612d0f",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-mas\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-mas"
              }
            }
          }
        },
        "16": {
          "position": {
            "x": 5,
            "y": 20,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "10ecfbe4-904f-4a1d-9710-1dbdb4314fa2",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-mas\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-mas"
              }
            }
          }
        },
        "17": {
          "position": {
            "x": 9,
            "y": 20,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "334155f5-2260-40dc-918f-68925256f1b6",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-mas\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "572px"
                },
                "PartSubTitle": "Container logs",
                "PartTitle": "uis-mas",
                "Query": "ContainerLog\n| where TimeGenerated > ago (200m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-mas\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "18": {
          "position": {
            "x": 0,
            "y": 24,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "2b9032e4-785d-4c9d-b15e-085fb314a54f",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-presentation-api\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-presentation-api"
              }
            }
          }
        },
        "19": {
          "position": {
            "x": 5,
            "y": 24,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1187c192-97e3-4cba-9110-ec850d211ffd",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-presentation-api\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-presentation-api"
              }
            }
          }
        },
        "20": {
          "position": {
            "x": 9,
            "y": 24,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "14d434de-6b2b-48f6-be39-54c91b2af1ae",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (20m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-presentation-api\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "571px"
                },
                "PartSubTitle": "Container logs",
                "PartTitle": "uis-presentation-api",
                "Query": "ContainerLog\n| where TimeGenerated > ago (200m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-presentation-api\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n"
              }
            }
          }
        },
        "21": {
          "position": {
            "x": 0,
            "y": 28,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "4c95f370-203b-416e-b811-d2f5f4e13c4c",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-device-event-processor\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utlization",
                "PartTitle": "uis-device-event-processor"
              }
            }
          }
        },
        "22": {
          "position": {
            "x": 5,
            "y": 28,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1ac7329c-52eb-43c9-b499-4612cc120130",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-device-event-processor\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-device-event-processor"
              }
            }
          }
        },
        "23": {
          "position": {
            "x": 9,
            "y": 28,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "3b899d1a-b513-4e7d-b15d-06e9f229453f",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (2000m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-device-event-processor\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "691px"
                },
                "PartSubTitle": "Container logs",
                "PartTitle": "uis-device-event-processor"
              }
            }
          }
        },
        "24": {
          "position": {
            "x": 0,
            "y": 32,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "90e67a30-a017-4690-910e-9a88ff06032e",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-provisioning-client\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-provisioning-client"
              }
            }
          }
        },
        "25": {
          "position": {
            "x": 5,
            "y": 32,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "58ac6e05-483a-4387-9868-3e24412d5819",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-provisioning-client\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-provisioning-client"
              }
            }
          }
        },
        "26": {
          "position": {
            "x": 9,
            "y": 32,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "1417dabd-4e41-43cd-b15c-d9f10e312d2b",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\n| where TimeGenerated > ago (2000m)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-provisioning-client\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartTitle": "uis-provisioning-client",
                "PartSubTitle": "Container logs"
              }
            }
          }
        },
        "27": {
          "position": {
            "x": 0,
            "y": 36,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "7c80f3c0-5262-45a1-9301-859791bd6405",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-web\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU ultization",
                "PartTitle": "uis-web"
              }
            }
          }
        },
        "28": {
          "position": {
            "x": 5,
            "y": 36,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "126d2578-12dd-496a-af85-e1c245a13baf",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-web\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-web"
              }
            }
          }
        },
        "29": {
          "position": {
            "x": 0,
            "y": 40,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "153f4553-12d3-466e-8c47-00367cd0534f",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-badger\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-badger"
              }
            }
          }
        },
        "30": {
          "position": {
            "x": 5,
            "y": 40,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "2022ce5d-7675-4e8b-816d-0ccdd97bb1b9",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-badger\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-badger"
              }
            }
          }
        },
        "31": {
          "position": {
            "x": 9,
            "y": 40,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "105820e2-12b9-42e8-a6e1-3fd3eeaf1276",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\n| where TimeGenerated > ago (48h)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"Uis-Badger\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartTitle": "uis-badger",
                "PartSubTitle": "Container logs"
              }
            }
          }
        },
        "32": {
          "position": {
            "x": 0,
            "y": 44,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "37116db2-7622-4407-825b-52e2f051d9aa",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-dle\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-dle"
              }
            }
          }
        },
        "33": {
          "position": {
            "x": 5,
            "y": 44,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "111ec07a-3935-4fb7-a478-2bb2e512523a",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"dev-uis-dle\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-dle"
              }
            }
          }
        },
        "34": {
          "position": {
            "x": 9,
            "y": 44,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "78fb04cf-6c5a-4773-b15d-47ae4a15f43a",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\n| where TimeGenerated > ago (48h)\n| order by TimeGenerated desc\n| where parse_json(LogEntry).ApplicationName == \"uis-dle\"\n| extend d=parse_json(LogEntry)\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\n| project timestamp, message\n\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "608px"
                },
                "PartTitle": "uis-dle",
                "PartSubTitle": "Container logs"
              }
            }
          }
        },
        "35": {
          "position": {
            "x": 0,
            "y": 48,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "0494da59-12ea-4ed2-a111-993a53126ad4",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"freddy-uis-freddy\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "freddy-uis-freddy"
              }
            }
          }
        },
        "36": {
          "position": {
            "x": 5,
            "y": 48,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "12cac7a3-4c90-4f33-b115-7237884dce11",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"freddy-uis-freddy\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "freddy-uis-freddy"
              }
            }
          }
        },
        "37": {
          "position": {
            "x": 0,
            "y": 52,
            "colSpan": 5,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "320e3ccf-1856-4e02-a13b-e94f28007b54",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'cpuLimitNanoCores';\r\nlet usageCounterName = 'cpuUsageNanoCores';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-maintenance-tool-processor\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName in  (controllerName)\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName = Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue, limitA=100\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue,\r\nlimit=100, TimeGenerated\r\n) on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue \r\n| summarize AggregatedValue=max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "CPU utilization",
                "PartTitle": "uis-maintenance-tool-processor"
              }
            }
          }
        },
        "38": {
          "position": {
            "x": 5,
            "y": 52,
            "colSpan": 4,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.ContainerService/managedClusters/${clusterName}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "15e81a74-8edc-4421-8633-cbbeca82d01f",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "value": {
                  "scope": "hierarchy"
                },
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "let endDateTime = now();\r\nlet startDateTime = ago(1h);\r\nlet trendBinSize = 1m;\r\nlet capacityCounterName = 'memoryLimitBytes';\r\nlet usageCounterName = 'memoryRssBytes';\r\nlet controllerName= toscalar (KubePodInventory\r\n    | where ControllerName contains \"uis-maintenance-tool-processor\"\r\n    | sort by TimeGenerated\r\n    | take 1\r\n    | distinct ControllerName);\r\nKubePodInventory\r\n| where TimeGenerated < endDateTime\r\n| where TimeGenerated >= startDateTime\r\n| where \"a\" == \"a\"\r\n| where ControllerKind in ('DaemonSet', 'ReplicaSet')\r\n| where Namespace in ('dev')\r\n| where ControllerName == controllerName\r\n| extend InstanceName = strcat(ClusterId, '/', ContainerName),\r\n    ContainerName = strcat(controllerName, '/', tostring(split(ContainerName, '/')[1])),\r\n    PodName=Name\r\n| where PodStatus in ('Running')\r\n| distinct Computer, InstanceName, ContainerName\r\n| join hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime\r\n    | where TimeGenerated >= startDateTime\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == capacityCounterName\r\n    | summarize LimitValue = max(CounterValue) by Computer, InstanceName, bin(TimeGenerated, trendBinSize)\r\n    | project Computer, InstanceName, LimitStartTime = TimeGenerated, LimitEndTime = TimeGenerated + trendBinSize, LimitValue\r\n    )\r\n    on Computer, InstanceName\r\n| join kind=inner hint.strategy=shuffle (\r\n    Perf\r\n    | where TimeGenerated < endDateTime + trendBinSize\r\n    | where TimeGenerated >= startDateTime - trendBinSize\r\n    | where ObjectName == 'K8SContainer'\r\n    | where CounterName == usageCounterName\r\n    | project Computer, InstanceName, UsageValue = CounterValue, TimeGenerated\r\n    )\r\n    on Computer, InstanceName\r\n| where TimeGenerated >= LimitStartTime and TimeGenerated < LimitEndTime\r\n| project Computer, ContainerName, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue\r\n| summarize AggregatedValue = max(UsagePercent) by bin(TimeGenerated, trendBinSize), ContainerName\r\n| render timechart \r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "FrameControlChart",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "value": "Line",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${clusterName}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "value": {
                  "aggregation": "Sum",
                  "splitBy": [
                    {
                      "name": "ContainerName",
                      "type": "string"
                    }
                  ],
                  "xAxis": {
                    "name": "TimeGenerated",
                    "type": "datetime"
                  },
                  "yAxis": [
                    {
                      "name": "AggregatedValue",
                      "type": "real"
                    }
                  ]
                },
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "value": {
                  "isEnabled": true,
                  "position": "Bottom"
                },
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "PartSubTitle": "Memory utilization",
                "PartTitle": "uis-maintenance-tool-processor"
              }
            }
          }
        },
        "39": {
          "position": {
            "x": 9,
            "y": 52,
            "colSpan": 10,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceTypeMode",
                "isOptional": true
              },
              {
                "name": "ComponentId",
                "isOptional": true
              },
              {
                "name": "Scope",
                "value": {
                  "resourceIds": [
                    "/subscriptions/${sub_id}/resourceGroups/${resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${workspace_name}"
                  ]
                },
                "isOptional": true
              },
              {
                "name": "PartId",
                "value": "7955ecfb-2517-43ca-8239-a179cd2e4dd1",
                "isOptional": true
              },
              {
                "name": "Version",
                "value": "2.0",
                "isOptional": true
              },
              {
                "name": "TimeRange",
                "value": "PT12H",
                "isOptional": true
              },
              {
                "name": "DashboardId",
                "isOptional": true
              },
              {
                "name": "DraftRequestParameters",
                "isOptional": true
              },
              {
                "name": "Query",
                "value": "ContainerLog\r\n| where TimeGenerated > ago (2000m)\r\n| order by TimeGenerated desc\r\n| where parse_json(LogEntry).ApplicationName == \"uis-maintenance-tool-processor\"\r\n| extend d=parse_json(LogEntry)\r\n| extend timestamp=d.[\"@t\"], message=d.[\"@m\"]\r\n| project timestamp, message\r\n\r\n",
                "isOptional": true
              },
              {
                "name": "ControlType",
                "value": "AnalyticsGrid",
                "isOptional": true
              },
              {
                "name": "SpecificChart",
                "isOptional": true
              },
              {
                "name": "PartTitle",
                "value": "Analytics",
                "isOptional": true
              },
              {
                "name": "PartSubTitle",
                "value": "${workspace_name}",
                "isOptional": true
              },
              {
                "name": "Dimensions",
                "isOptional": true
              },
              {
                "name": "LegendOptions",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
            "settings": {
              "content": {
                "GridColumnsWidth": {
                  "message": "711px"
                },
                "PartSubTitle": "Container logs",
                "PartTitle": "uis-maintenance-tool-processor"
              }
            }
          }
        }
      }
    }
  },
  "metadata": {
    "model": {
      "timeRange": {
        "value": {
          "relative": {
            "duration": 24,
            "timeUnit": 1
          }
        },
        "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
      },
      "filterLocale": {
        "value": "en-us"
      },
      "filters": {
        "value": {
          "MsPortalFx_TimeRange": {
            "model": {
              "format": "utc",
              "granularity": "auto",
              "relative": "12h"
            },
            "displayCache": {
              "name": "UTC Time",
              "value": "Past 12 hours"
            },
            "filteredPartIds": [
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cb9",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cbb",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cbd",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cbf",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cc1",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cc3",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cc5",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cc7",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cc9",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ccb",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ccd",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ccf",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cd1",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cd3",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cd5",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cd7",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cd9",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cdb",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cdd",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cdf",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ce1",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ce3",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ce5",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ce7",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ce9",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ceb",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204ced",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cef",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cf1",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cf3",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cf5",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cf7",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cf9",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cfb",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cfd",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204cff",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204d01",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204d03",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204d05",
              "StartboardPart-LogsDashboardPart-46b96b34-a0c8-443a-9972-919fde204d07"
            ]
          }
        }
      }
    }
  }
}
