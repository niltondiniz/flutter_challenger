import 'package:hive/hive.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';

part 'license.g.dart';

@HiveType(typeId: 3)
class License extends HiveObject implements IModel {
  @HiveField(0)
  String key;
  @HiveField(2)
  String name;
  @HiveField(3)
  String spdxId;
  @HiveField(4)
  String url;
  @HiveField(5)
  String nodeId;

  License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['spdx_id'] = this.spdxId;
    data['url'] = this.url;
    data['node_id'] = this.nodeId;
    return data;
  }
}
