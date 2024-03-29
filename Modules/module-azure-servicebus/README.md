﻿# module-azure-servicebus

Terraform module to provision an [Azure ServiceBus](<https://docs.microsoft.com/en-us/azure/service-bus-messaging/>).

## Usage

```HCL
module "sb" {
  source                 = "./../module-azure-servicebus"
  name                   = "uis-infra-dev-eastus-1"
  resource_group_name    = "rg-uis-infra-dev-eastus-1"
  location               = "eastus"
  subnet_id              = "/subscriptions/8cc6b0e7-e341-4103-bed6-574d6b298337/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/default"
  servicebus_topic_names = ["topc1", "topic2"]
  sku                    = "Premium"
  sb_ip_whitelist        = "0.0.0.0,1.1.1.1"

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }
}

```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="input_location"></a> [location](#input_location) | Service Bus location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input_name) | Service Bus name | `any` | n/a | yes|
| <a name="input_short_name"></a> [short_name](#input_name) | Service Bus short name | `any` | n/a | yes|
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Resource group name | `any` | n/a |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id) | The ID of the subnet that the Service Bus server will be connected to. | `any` | n/a | no |
| <a name="input_capacity"></a> [capacity](#input_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `string` | `"1"` | no |
| <a name="input_dead_lettering_on_filter_evaluation"></a> [dead_lettering_on_filter_evaluation](#input_dead_lettering_on_filter_evaluation) | Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions. Defaults to true. | `string` | `"true"` | no |
| <a name="input_dead_lettering_on_message_expiration"></a> [dead_lettering_on_message_expiration](#input_dead_lettering_on_message_expiration) | Boolean flag which controls whether the Subscription has dead letter support when a message expires. Defaults to false. | `string` | `"false"` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate_detection_history_time_window](#input_duplicate_detection_history_time_window) | The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes. | `string` | `"PT10M"` | no |
| <a name="input_enable_express"></a> [enable_express](#input_enable_express) | Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false. | `string` | `"false"` | no |
| <a name="input_enable_partitioning"></a> [enable_partitioning](#input_enable_partitioning) | Boolean flag which controls whether Express Entities are enabled. An express topic holds a message in memory temporarily before writing it to persistent storage. Defaults to false. | `bool` | `false` | no |
| <a name="input_forward_dead_lettered_messages_to"></a> [forward_dead_lettered_messages_to](#input_forward_dead_lettered_messages_to) | The name of a Queue or Topic to automatically forward Dead Letter messages to. | `string` | `""` | no |
| <a name="input_forward_to"></a> [forward_to](#input_forward_to) | The name of a Queue or Topic to automatically forward messages to. | `string` | `""` | no |
| <a name="input_ignore_missing_vnet_service_endpoint"></a> [ignore_missing_vnet_service_endpoint](#input_ignore_missing_vnet_service_endpoint) | Should the ServiceBus Namespace Network Rule Set ignore missing Virtual Network Service Endpoint option in the Subnet? Defaults to false. | `string` | `"false"` | no |
| <a name="input_listen"></a> [listen](#input_listen) | Grants listen access to this this Authorization Rule. Defaults to false | `string` | `"true"` | no |
| <a name="input_lock_duration"></a> [lock_duration](#input_lock_duration) | The lock duration for the subscription as an ISO 8601 duration. The default value is 1 minute or PT1M. | `string` | `"PT1M"` | no |
| <a name="input_manage"></a> [manage](#input_manage) | Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false. | `string` | `"false"` | no |
| <a name="input_max_delivery_count"></a> [max_delivery_count](#input_max_delivery_count) | The maximum number of deliveries. | `string` | `"1"` |
| <a name="input_max_size_in_megabytes"></a> [max_size_in_megabytes](#input_max_size_in_megabytes) | integer value which controls the size of memory allocated for the topic. | `string` | `"1024"` | no |
| <a name="input_requires_duplicate_detection"></a> [requires_duplicate_detection](#input_requires_duplicate_detection) | Boolean flag which controls whether the Topic requires duplicate detection. Defaults to false. Changing this forces a new resource to be created. | `string` | `"false"` | no |
| <a name="input_requires_session"></a> [requires_session](#input_requires_session) | Boolean flag which controls whether this Subscription supports the concept of a session. Changing this forces a new resource to be created. | `string` | `"true"` | no |
| <a name="input_sb_ip_whitelist"></a> [sb_ip_whitelist](#input_sb_ip_whitelist) | SQL ip whitelist addresses | `string` | `"0.0.0.0"` | no |
| <a name="input_send"></a> [send](#input_send) | Grants send access to this this Authorization Rule. Defaults to false | `string` | `"false"` | no |
| <a name="input_servicebus_subscription_default_message_ttl"></a> [servicebus_subscription_default_message_ttl](#input_servicebus_subscription_default_message_ttl) | The Default message timespan to live as an ISO 8601 duration. This is the duration after which the message expires, starting from when the message is sent to Service Bus. This is the default value used when TimeToLive is not set on a message itself. | `string` | `"PT5M"` | no |
| <a name="input_servicebus_subscription_enable_batched_operations"></a> [servicebus_subscription_enable_batched_operations](#input_servicebus_subscription_enable_batched_operations) | Boolean flag which controls whether the Subscription supports batched operations. Defaults to false. | `string` | `"true"` | no |
| <a name="input_servicebus_subscription_status"></a> [servicebus_subscription_status](#input_servicebus_subscription_status) | The status of the Subscription. Possible values are Active,ReceiveDisabled, or Disabled. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_servicebus_topic_default_message_ttl"></a> [servicebus_topic_default_message_ttl](#input_servicebus_topic_default_message_ttl) | The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself. | `string` | `"PT5M"` | no |
| <a name="input_servicebus_topic_enable_batched_operations"></a> [servicebus_topic_enable_batched_operations](#input_servicebus_topic_enable_batched_operations) | Boolean flag which controls if server-side batched operations are enabled. Defaults to false. | `string` | `"false"` | no |
| <a name="input_servicebus_topic_names"></a> [servicebus_topic_names](#input_servicebus_topic_names) | A list of topics name | `list(string)` | `[]` | yes |
| <a name="input_servicebus_topic_status"></a> [servicebus_topic_status](#input_servicebus_topic_status) | The Status of the Service Bus Topic. Acceptable values are Active or Disabled. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_sku"></a> [sku](#input_sku) | Defines which tier to use. Options are basic, standard or premium. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_support_ordering"></a> [support_ordering](#input_support_ordering) | Boolean flag which controls whether the Topic supports ordering. Defaults to false. | `string` | `"false"` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A mapping of tags to assign to Service Bus | `map` | `{}` |
| <a name="input_zone_redundant"></a> [zone_redundant](#input_zone_redundant) | Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false. | `bool` | `false` | no |



## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sb_id"></a> [sb_id](#output_sb_id) | The ServiceBus Namespace ID |
| <a name="output_sb_location"></a> [sb_location](#output_sb_location) | The ServiceBus Namespace Location |
| <a name="output_sb_name"></a> [sb_name](#output_sb_name) | The ServiceBus Namespace Name |
| <a name="output_sb_subscription_ids"></a> [sb_subscription_ids](#output_sb_subscription_ids) | The ServiceBus Subscription Ids |
| <a name="output_sb_subscription_names"></a> [sb_subscription_names](#output_sb_subscription_names) | The ServiceBus Subscription Names |
| <a name="output_sb_topic_ids"></a> [sb_topic_ids](#output_sb_topic_ids) | The ServiceBus Topics Ids |
| <a name="output_sb_topic_names"></a> [sb_topic_names](#output_sb_topic_names) | The ServiceBus Topics Names |


## Changelog

### v 0.0.1 2021-05-06

* Initial version㰊ⴡ‭䕂䥇乎义⁇䙏倠䕒䌭䵏䥍ⵔ䕔剒䙁剏⁍佄千䠠住⁋ⴭਾ⌣删煥極敲敭瑮ੳ上⁯敲畱物浥湥獴ਮ⌊‣牐癯摩牥ੳ簊丠浡⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽牰癯摩牥慟畺敲浲㸢⼼㹡嬠穡牵牥嵭⌨牰癯摩牥彜穡牵牥⥭簠渠愯簠ਊ⌣䴠摯汵獥ਊ潎洠摯汵獥ਮ⌊‣敒潳牵散ੳ簊丠浡⁥⁼祔数簠簊ⴭⴭⴭ⵼ⴭⴭ簭簊嬠穡牵牥彭敳癲捩扥獵湟浡獥慰散献牥楶散畢嵳栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲栯獡楨潣灲愯畺敲浲氯瑡獥⽴潤獣爯獥畯捲獥猯牥楶散畢彳慮敭灳捡⥥簠爠獥畯捲⁥੼⁼慛畺敲浲獟牥楶散畢彳慮敭灳捡彥敮睴牯彫畲敬獟瑥献牥楶散畢彳慮敭灳捡彥敮睴牯彫畲敬獟瑥⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰穡牵牥⽭慬整瑳搯捯⽳敲潳牵散⽳敳癲捩扥獵湟浡獥慰散湟瑥潷歲牟汵彥敳⥴簠爠獥畯捲⁥੼⁼慛畺敲浲獟牥楶散畢彳畳獢牣灩楴湯献牥楶散畢彳畳獢牣灩楴湯⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰穡牵牥⽭慬整瑳搯捯⽳敲潳牵散⽳敳癲捩扥獵獟扵捳楲瑰潩⥮簠爠獥畯捲⁥੼⁼慛畺敲浲獟牥楶散畢彳潴楰⹣敳癲捩扥獵瑟灯捩⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰穡牵牥⽭慬整瑳搯捯⽳敲潳牵散⽳敳癲捩扥獵瑟灯捩 ⁼敲潳牵散簠簊嬠穡牵牥彭敳癲捩扥獵瑟灯捩慟瑵潨楲慺楴湯牟汵⹥敳癲捩扥獵瑟灯捩慟瑵潨楲慺楴湯牟汵嵥栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲栯獡楨潣灲愯畺敲浲氯瑡獥⽴潤獣爯獥畯捲獥猯牥楶散畢彳潴楰彣畡桴牯穩瑡潩彮畲敬 ⁼敲潳牵散簠ਊ⌣䤠灮瑵ੳ簊丠浡⁥⁼敄捳楲瑰潩⁮⁼祔数簠䐠晥畡瑬簠删煥極敲⁤੼⵼ⴭⴭ簭ⴭⴭⴭⴭⴭⴭ簭ⴭⴭⴭ⵼ⴭⴭⴭⴭ㩼ⴭⴭⴭⴭ簺簊㰠⁡慮敭∽湩異彴慣慰楣祴㸢⼼㹡嬠慣慰楣祴⡝椣灮瑵彜慣慰楣祴 ⁼灓捥晩敩⁳桴⁥慣慰楣祴‮桗湥猠畫椠⁳牐浥畩Ɑ挠灡捡瑩⁹慣⁮敢ㄠ‬ⰲ㐠‬‸牯ㄠ⸶圠敨⁮歳⁵獩䈠獡捩漠⁲瑓湡慤摲‬慣慰楣祴挠湡戠⁥‰湯祬‮⁼獠牴湩恧簠怠ㄢ怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵损敲瑡彥敳癲捩扥獵㸢⼼㹡嬠牣慥整彜敳癲捩扥獵⡝椣灮瑵彜牣慥整彜敳癲捩扥獵 ⁼牃慥整匠牥楶散畂⁳⁼扠潯恬簠怠牴敵⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敤摡江瑥整楲杮潟彮楦瑬牥敟慶畬瑡潩彮牥潲≲㰾愯‾摛慥層江瑥整楲杮彜湯彜楦瑬牥彜癥污慵楴湯彜牥潲嵲⌨湩異屴摟慥層江瑥整楲杮彜湯彜楦瑬牥彜癥污慵楴湯彜牥潲⥲簠䈠潯敬湡映慬⁧桷捩⁨潣瑮潲獬眠敨桴牥琠敨匠扵捳楲瑰潩⁮慨⁳敤摡氠瑥整⁲畳灰牯⁴湯映汩整⁲癥污慵楴湯攠捸灥楴湯⹳䐠晥畡瑬⁳潴琠畲⹥簠怠瑳楲杮⁠⁼≠牴敵怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵摟慥彤敬瑴牥湩彧湯浟獥慳敧敟灸物瑡潩≮㰾愯‾摛慥層江瑥整楲杮彜湯彜敭獳条履敟灸物瑡潩嵮⌨湩異屴摟慥層江瑥整楲杮彜湯彜敭獳条履敟灸物瑡潩⥮簠䈠潯敬湡映慬⁧桷捩⁨潣瑮潲獬眠敨桴牥琠敨匠扵捳楲瑰潩⁮慨⁳敤摡氠瑥整⁲畳灰牯⁴桷湥愠洠獥慳敧攠灸物獥‮敄慦汵獴琠⁯慦獬⹥簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴畤汰捩瑡彥敤整瑣潩彮楨瑳牯役楴敭睟湩潤≷㰾愯‾摛灵楬慣整彜敤整瑣潩屮桟獩潴祲彜楴敭彜楷摮睯⡝椣灮瑵彜畤汰捩瑡履摟瑥捥楴湯彜楨瑳牯屹瑟浩履睟湩潤⥷簠吠敨䤠体㠠〶‱楴敭灳湡搠牵瑡潩⁮畤楲杮眠楨档搠灵楬慣整⁳慣⁮敢搠瑥捥整⹤䐠晥畡瑬⁳潴ㄠ‰業畮整⹳簠怠瑳楲杮⁠⁼≠呐〱≍⁠⁼潮簠簊㰠⁡慮敭∽湩異彴湥扡敬敟灸敲獳㸢⼼㹡嬠湥扡敬彜硥牰獥嵳⌨湩異屴敟慮汢履敟灸敲獳 ⁼潂汯慥⁮汦条眠楨档挠湯牴汯⁳桷瑥敨⁲硅牰獥⁳湅楴楴獥愠敲攠慮汢摥‮湁攠灸敲獳琠灯捩栠汯獤愠洠獥慳敧椠⁮敭潭祲琠浥潰慲楲祬戠晥牯⁥牷瑩湩⁧瑩琠⁯数獲獩整瑮猠潴慲敧‮敄慦汵獴琠⁯慦獬⹥簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴湥扡敬灟牡楴楴湯湩≧㰾愯‾敛慮汢履灟牡楴楴湯湩嵧⌨湩異屴敟慮汢履灟牡楴楴湯湩⥧簠䈠潯敬湡映慬⁧桷捩⁨潣瑮潲獬眠敨桴牥䔠灸敲獳䔠瑮瑩敩⁳牡⁥湥扡敬⹤䄠⁮硥牰獥⁳潴楰⁣潨摬⁳⁡敭獳条⁥湩洠浥牯⁹整灭牯牡汩⁹敢潦敲眠楲楴杮椠⁴潴瀠牥楳瑳湥⁴瑳牯条⹥䐠晥畡瑬⁳潴映污敳‮⁼扠潯恬簠怠慦獬恥簠渠⁯੼⁼愼渠浡㵥椢灮瑵晟牯慷摲摟慥彤敬瑴牥摥浟獥慳敧彳潴㸢⼼㹡嬠潦睲牡層摟慥層江瑥整敲層浟獥慳敧屳瑟嵯⌨湩異屴晟牯慷摲彜敤摡彜敬瑴牥摥彜敭獳条獥彜潴 ⁼桔⁥慮敭漠⁦⁡畑略⁥牯吠灯捩琠⁯畡潴慭楴慣汬⁹潦睲牡⁤敄摡䰠瑥整⁲敭獳条獥琠⹯簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵晟牯慷摲瑟≯㰾愯‾晛牯慷摲彜潴⡝椣灮瑵彜潦睲牡層瑟⥯簠吠敨渠浡⁥景愠儠敵敵漠⁲潔楰⁣潴愠瑵浯瑡捩污祬映牯慷摲洠獥慳敧⁳潴‮⁼獠牴湩恧簠怠∢⁠⁼潮簠簊㰠⁡慮敭∽湩異彴杩潮敲浟獩楳杮癟敮彴敳癲捩彥湥灤楯瑮㸢⼼㹡嬠杩潮敲彜業獳湩屧癟敮屴獟牥楶散彜湥灤楯瑮⡝椣灮瑵彜杩潮敲彜業獳湩屧癟敮屴獟牥楶散彜湥灤楯瑮 ⁼桓畯摬琠敨匠牥楶散畂⁳慎敭灳捡⁥敎睴牯⁫畒敬匠瑥椠湧牯⁥業獳湩⁧楖瑲慵⁬敎睴牯⁫敓癲捩⁥湅灤楯瑮漠瑰潩⁮湩琠敨匠扵敮㽴䐠晥畡瑬⁳潴映污敳‮⁼獠牴湩恧簠怠昢污敳怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵江獩整≮㰾愯‾汛獩整嵮⌨湩異屴江獩整⥮簠䜠慲瑮⁳楬瑳湥愠捣獥⁳潴琠楨⁳桴獩䄠瑵潨楲慺楴湯删汵⹥䐠晥畡瑬⁳潴映污敳簠怠瑳楲杮⁠⁼≠牴敵怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵江捯瑡潩≮㰾愯‾汛捯瑡潩嵮⌨湩異屴江捯瑡潩⥮簠匠牥楶散䈠獵氠捯瑡潩⁮भ敷瑳略潲数支獡畴⁳⁼慠祮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵江捯彫畤慲楴湯㸢⼼㹡嬠潬正彜畤慲楴湯⡝椣灮瑵彜潬正彜畤慲楴湯 ⁼桔⁥潬正搠牵瑡潩⁮潦⁲桴⁥畳獢牣灩楴湯愠⁳湡䤠体㠠〶‱畤慲楴湯‮桔⁥敤慦汵⁴慶畬⁥獩ㄠ洠湩瑵⁥牯倠ㅔ⹍簠怠瑳楲杮⁠⁼≠呐䴱怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵浟湡条≥㰾愯‾浛湡条嵥⌨湩異屴浟湡条⥥簠䜠慲瑮⁳慭慮敧愠捣獥⁳潴琠楨⁳桴獩䄠瑵潨楲慺楴湯删汵⹥圠敨⁮桴獩瀠潲数瑲⁹獩琠畲⁥‭潢桴氠獩整⁮湡⁤敳摮洠獵⁴敢琠潯‮敄慦汵獴琠⁯慦獬⹥簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴慭彸敤楬敶祲损畯瑮㸢⼼㹡嬠慭屸摟汥癩牥屹损畯瑮⡝椣灮瑵彜慭屸摟汥癩牥屹损畯瑮 ⁼桔⁥慭楸畭⁭畮扭牥漠⁦敤楬敶楲獥‮⁼獠牴湩恧簠怠ㄢ怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵浟硡獟穩彥湩浟来扡瑹獥㸢⼼㹡嬠慭屸獟穩履楟屮浟来扡瑹獥⡝椣灮瑵彜慭屸獟穩履楟屮浟来扡瑹獥 ⁼湩整敧⁲慶畬⁥桷捩⁨潣瑮潲獬琠敨猠穩⁥景洠浥牯⁹污潬慣整⁤潦⁲桴⁥潴楰⹣簠怠瑳楲杮⁠⁼≠〱㐲怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵湟浡≥㰾愯‾湛浡嵥⌨湩異屴湟浡⥥簠匠牥楶散䈠獵渠浡⁥⁼慠祮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵牟煥極敲彳畤汰捩瑡彥敤整瑣潩≮㰾愯‾牛煥極敲屳摟灵楬慣整彜敤整瑣潩嵮⌨湩異屴牟煥極敲屳摟灵楬慣整彜敤整瑣潩⥮簠䈠潯敬湡映慬⁧桷捩⁨潣瑮潲獬眠敨桴牥琠敨吠灯捩爠煥極敲⁳畤汰捩瑡⁥敤整瑣潩⹮䐠晥畡瑬⁳潴映污敳‮桃湡楧杮琠楨⁳潦捲獥愠渠睥爠獥畯捲⁥潴戠⁥牣慥整⹤簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敲畱物獥獟獥楳湯㸢⼼㹡嬠敲畱物獥彜敳獳潩嵮⌨湩異屴牟煥極敲屳獟獥楳湯 ⁼潂汯慥⁮汦条眠楨档挠湯牴汯⁳桷瑥敨⁲桴獩匠扵捳楲瑰潩⁮畳灰牯獴琠敨挠湯散瑰漠⁦⁡敳獳潩⹮䌠慨杮湩⁧桴獩映牯散⁳⁡敮⁷敲潳牵散琠⁯敢挠敲瑡摥‮⁼獠牴湩恧簠怠琢畲≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敲潳牵散束潲灵湟浡≥㰾愯‾牛獥畯捲履束潲灵彜慮敭⡝椣灮瑵彜敲潳牵散彜牧畯屰湟浡⥥簠删獥畯捲⁥牧畯⁰慮敭簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴扳楟彰桷瑩汥獩≴㰾愯‾獛屢楟屰睟楨整楬瑳⡝椣灮瑵彜扳彜灩彜桷瑩汥獩⥴簠匠䱑椠⁰桷瑩汥獩⁴摡牤獥敳⁳⁼獠牴湩恧簠怠〢〮〮〮怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟湥≤㰾愯‾獛湥嵤⌨湩異屴獟湥⥤簠䜠慲瑮⁳敳摮愠捣獥⁳潴琠楨⁳桴獩䄠瑵潨楲慺楴湯删汵⹥䐠晥畡瑬⁳潴映污敳簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敳癲捩扥獵獟扵捳楲瑰潩彮敤慦汵彴敭獳条彥瑴≬㰾愯‾獛牥楶散畢屳獟扵捳楲瑰潩屮摟晥畡瑬彜敭獳条履瑟汴⡝椣灮瑵彜敳癲捩扥獵彜畳獢牣灩楴湯彜敤慦汵屴浟獥慳敧彜瑴⥬簠吠敨䐠晥畡瑬洠獥慳敧琠浩獥慰⁮潴氠癩⁥獡愠⁮卉⁏㘸㄰搠牵瑡潩⹮吠楨⁳獩琠敨搠牵瑡潩⁮晡整⁲桷捩⁨桴⁥敭獳条⁥硥楰敲ⱳ猠慴瑲湩⁧牦浯眠敨⁮桴⁥敭獳条⁥獩猠湥⁴潴匠牥楶散䈠獵‮桔獩椠⁳桴⁥敤慦汵⁴慶畬⁥獵摥眠敨⁮楔敭潔楌敶椠⁳潮⁴敳⁴湯愠洠獥慳敧椠獴汥⹦簠怠瑳楲杮⁠⁼≠呐䴵怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟牥楶散畢彳畳獢牣灩楴湯敟慮汢彥慢捴敨彤灯牥瑡潩獮㸢⼼㹡嬠敳癲捩扥獵彜畳獢牣灩楴湯彜湥扡敬彜慢捴敨層潟数慲楴湯嵳⌨湩異屴獟牥楶散畢屳獟扵捳楲瑰潩屮敟慮汢履扟瑡档摥彜灯牥瑡潩獮 ⁼潂汯慥⁮汦条眠楨档挠湯牴汯⁳桷瑥敨⁲桴⁥畓獢牣灩楴湯猠灵潰瑲⁳慢捴敨⁤灯牥瑡潩獮‮敄慦汵獴琠⁯慦獬⹥簠怠瑳楲杮⁠⁼≠牴敵怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟牥楶散畢彳畳獢牣灩楴湯獟慴畴≳㰾愯‾獛牥楶散畢屳獟扵捳楲瑰潩屮獟慴畴嵳⌨湩異屴獟牥楶散畢屳獟扵捳楲瑰潩屮獟慴畴⥳簠吠敨猠慴畴⁳景琠敨匠扵捳楲瑰潩⹮倠獯楳汢⁥慶畬獥愠敲䄠瑣癩ⱥ敒散癩䑥獩扡敬Ɽ漠⁲楄慳汢摥‮敄慦汵獴琠⁯捁楴敶‮⁼獠牴湩恧簠怠䄢瑣癩≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敳癲捩扥獵瑟灯捩摟晥畡瑬浟獥慳敧瑟汴㸢⼼㹡嬠敳癲捩扥獵彜潴楰屣摟晥畡瑬彜敭獳条履瑟汴⡝椣灮瑵彜敳癲捩扥獵彜潴楰屣摟晥畡瑬彜敭獳条履瑟汴 ⁼桔⁥卉⁏㘸㄰琠浩獥慰⁮畤慲楴湯漠⁦呔⁌景洠獥慳敧⁳敳瑮琠⁯桴獩琠灯捩椠⁦潮吠䱔瘠污敵椠⁳敳⁴湯琠敨洠獥慳敧椠獴汥⹦簠怠瑳楲杮⁠⁼≠呐䴵怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟牥楶散畢彳潴楰彣湥扡敬扟瑡档摥潟数慲楴湯≳㰾愯‾獛牥楶散畢屳瑟灯捩彜湥扡敬彜慢捴敨層潟数慲楴湯嵳⌨湩異屴獟牥楶散畢屳瑟灯捩彜湥扡敬彜慢捴敨層潟数慲楴湯⥳簠䈠潯敬湡映慬⁧桷捩⁨潣瑮潲獬椠⁦敳癲牥猭摩⁥慢捴敨⁤灯牥瑡潩獮愠敲攠慮汢摥‮敄慦汵獴琠⁯慦獬⹥簠怠瑳楲杮⁠⁼≠慦獬≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敳癲捩扥獵瑟灯捩湟浡獥㸢⼼㹡嬠敳癲捩扥獵彜潴楰屣湟浡獥⡝椣灮瑵彜敳癲捩扥獵彜潴楰屣湟浡獥 ⁼⁁楬瑳漠⁦潴楰獣渠浡⁥⁼池獩⡴瑳楲杮怩簠怠嵛⁠⁼潮簠簊㰠⁡慮敭∽湩異彴敳癲捩扥獵瑟灯捩獟慴畴≳㰾愯‾獛牥楶散畢屳瑟灯捩彜瑳瑡獵⡝椣灮瑵彜敳癲捩扥獵彜潴楰屣獟慴畴⥳簠吠敨匠慴畴⁳景琠敨匠牥楶散䈠獵吠灯捩‮捁散瑰扡敬瘠污敵⁳牡⁥捁楴敶漠⁲楄慳汢摥‮敄慦汵獴琠⁯捁楴敶‮⁼獠牴湩恧簠怠䄢瑣癩≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴桳牯彴慮敭㸢⼼㹡嬠桳牯屴湟浡嵥⌨湩異屴獟潨瑲彜慮敭 ⁼敓癲捩⁥畂⁳桳牯⁴慮敭簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴歳≵㰾愯‾獛畫⡝椣灮瑵彜歳⥵簠䐠晥湩獥眠楨档琠敩⁲潴甠敳‮灏楴湯⁳牡⁥慢楳Ᵽ猠慴摮牡⁤牯瀠敲業浵‮桃湡楧杮琠楨⁳潦捲獥愠渠睥爠獥畯捲⁥潴戠⁥牣慥整⹤簠怠瑳楲杮⁠⁼≠瑓湡慤摲怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟扵敮彴摩㸢⼼㹡嬠畳湢瑥彜摩⡝椣灮瑵彜畳湢瑥彜摩 ⁼桔⁥䑉漠⁦桴⁥畳湢瑥琠慨⁴桴⁥敓癲捩⁥畂⁳敳癲牥眠汩⁬敢挠湯敮瑣摥琠⹯簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴畳灰牯彴牯敤楲杮㸢⼼㹡嬠畳灰牯屴潟摲牥湩嵧⌨湩異屴獟灵潰瑲彜牯敤楲杮 ⁼潂汯慥⁮汦条眠楨档挠湯牴汯⁳桷瑥敨⁲桴⁥潔楰⁣畳灰牯獴漠摲牥湩⹧䐠晥畡瑬⁳潴映污敳‮⁼獠牴湩恧簠怠昢污敳怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵瑟条≳㰾愯‾瑛条嵳⌨湩異屴瑟条⥳簠䄠洠灡楰杮漠⁦慴獧琠⁯獡楳湧琠⁯敓癲捩⁥畂⁳⁼浠灡⁠⁼筠恽簠渠⁯੼⁼愼渠浡㵥椢灮瑵穟湯彥敲畤摮湡≴㰾愯‾穛湯履牟摥湵慤瑮⡝椣灮瑵彜潺敮彜敲畤摮湡⥴簠圠敨桴牥漠⁲潮⁴桴獩爠獥畯捲⁥獩稠湯⁥敲畤摮湡⹴猠畫渠敥獤琠⁯敢倠敲業浵‮敄慦汵獴琠⁯慦獬⹥簠怠潢汯⁠⁼晠污敳⁠⁼潮簠ਊ⌣传瑵異獴ਊ⁼慎敭簠䐠獥牣灩楴湯簠簊ⴭⴭⴭ⵼ⴭⴭⴭⴭⴭⴭ੼⁼愼渠浡㵥漢瑵異彴扳楟≤㰾愯‾獛屢楟嵤⌨畯灴瑵彜扳彜摩 ⁼桔⁥敓癲捩䉥獵丠浡獥慰散䤠⁄੼⁼愼渠浡㵥漢瑵異彴扳江捯瑡潩≮㰾愯‾獛屢江捯瑡潩嵮⌨畯灴瑵彜扳彜潬慣楴湯 ⁼桔⁥敓癲捩䉥獵丠浡獥慰散䰠捯瑡潩⁮੼⁼愼渠浡㵥漢瑵異彴扳湟浡≥㰾愯‾獛屢湟浡嵥⌨畯灴瑵彜扳彜慮敭 ⁼桔⁥敓癲捩䉥獵丠浡獥慰散丠浡⁥੼⁼愼渠浡㵥漢瑵異彴扳獟扵捳楲瑰潩彮摩≳㰾愯‾獛屢獟扵捳楲瑰潩屮楟獤⡝漣瑵異屴獟屢獟扵捳楲瑰潩屮楟獤 ⁼桔⁥敓癲捩䉥獵匠扵捳楲瑰潩⁮摉⁳੼⁼愼渠浡㵥漢瑵異彴扳獟扵捳楲瑰潩彮慮敭≳㰾愯‾獛屢獟扵捳楲瑰潩屮湟浡獥⡝漣瑵異屴獟屢獟扵捳楲瑰潩屮湟浡獥 ⁼桔⁥敓癲捩䉥獵匠扵捳楲瑰潩⁮慎敭⁳੼⁼愼渠浡㵥漢瑵異彴扳瑟灯捩楟獤㸢⼼㹡嬠扳彜潴楰屣楟獤⡝漣瑵異屴獟屢瑟灯捩彜摩⥳簠吠敨匠牥楶散畂⁳潔楰獣䤠獤簠簊㰠⁡慮敭∽畯灴瑵獟形潴楰彣慮敭≳㰾愯‾獛屢瑟灯捩彜慮敭嵳⌨畯灴瑵彜扳彜潴楰屣湟浡獥 ⁼桔⁥敓癲捩䉥獵吠灯捩⁳慎敭⁳੼ℼⴭ䔠䑎传⁆剐ⵅ佃䵍呉吭剅䅒但䵒䐠䍏⁓佈䭏ⴠ㸭�