import 'package:hive/hive.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject implements IModel {
  @HiveField(0)
  String login;
  @HiveField(1)
  int id;
  @HiveField(2)
  String nodeId;
  @HiveField(3)
  String avatarUrl;
  @HiveField(4)
  String gravatarId;
  @HiveField(5)
  String url;
  @HiveField(6)
  String htmlUrl;
  @HiveField(7)
  String followersUrl;
  @HiveField(8)
  String followingUrl;
  @HiveField(9)
  String gistsUrl;
  @HiveField(10)
  String starredUrl;
  @HiveField(11)
  String subscriptionsUrl;
  @HiveField(12)
  String organizationsUrl;
  @HiveField(13)
  String reposUrl;
  @HiveField(14)
  String eventsUrl;
  @HiveField(15)
  String receivedEventsUrl;
  @HiveField(16)
  String type;
  @HiveField(17)
  bool siteAdmin;
  @HiveField(18)
  double score;

  UserModel(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.score});

  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    data['score'] = this.score;
    return data;
  }
}
