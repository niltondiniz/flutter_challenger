import 'package:hive/hive.dart';
import 'package:radix_challenge/app/shared/models/interfaces/model_interface.dart';
import 'package:radix_challenge/app/shared/models/license.dart';
import 'package:radix_challenge/app/shared/models/owner.dart';

part 'repository_model.g.dart';

@HiveType(typeId: 1)
class RepositoryModel extends HiveObject implements IModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String nodeId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String fullName;
  @HiveField(4)
  bool private;
  @HiveField(5)
  Owner owner;
  @HiveField(6)
  String htmlUrl;
  @HiveField(7)
  String description;
  @HiveField(8)
  bool fork;
  @HiveField(9)
  String url;
  @HiveField(10)
  String forksUrl;
  @HiveField(11)
  String keysUrl;
  @HiveField(12)
  String collaboratorsUrl;
  @HiveField(13)
  String teamsUrl;
  @HiveField(14)
  String hooksUrl;
  @HiveField(15)
  String issueEventsUrl;
  @HiveField(16)
  String eventsUrl;
  @HiveField(17)
  String assigneesUrl;
  @HiveField(18)
  String branchesUrl;
  @HiveField(19)
  String tagsUrl;
  @HiveField(20)
  String blobsUrl;
  @HiveField(21)
  String gitTagsUrl;
  @HiveField(22)
  String gitRefsUrl;
  @HiveField(23)
  String treesUrl;
  @HiveField(24)
  String statusesUrl;
  @HiveField(25)
  String languagesUrl;
  @HiveField(26)
  String stargazersUrl;
  @HiveField(27)
  String contributorsUrl;
  @HiveField(28)
  String subscribersUrl;
  @HiveField(29)
  String subscriptionUrl;
  @HiveField(30)
  String commitsUrl;
  @HiveField(31)
  String gitCommitsUrl;
  @HiveField(32)
  String commentsUrl;
  @HiveField(33)
  String issueCommentUrl;
  @HiveField(34)
  String contentsUrl;
  @HiveField(35)
  String compareUrl;
  @HiveField(36)
  String mergesUrl;
  @HiveField(37)
  String archiveUrl;
  @HiveField(38)
  String downloadsUrl;
  @HiveField(39)
  String issuesUrl;
  @HiveField(40)
  String pullsUrl;
  @HiveField(41)
  String milestonesUrl;
  @HiveField(42)
  String notificationsUrl;
  @HiveField(43)
  String labelsUrl;
  @HiveField(44)
  String releasesUrl;
  @HiveField(45)
  String deploymentsUrl;
  @HiveField(46)
  String createdAt;
  @HiveField(47)
  String updatedAt;
  @HiveField(48)
  String pushedAt;
  @HiveField(49)
  String gitUrl;
  @HiveField(50)
  String sshUrl;
  @HiveField(51)
  String cloneUrl;
  @HiveField(52)
  String svnUrl;
  @HiveField(53)
  String homepage;
  @HiveField(54)
  int size;
  @HiveField(55)
  int stargazersCount;
  @HiveField(56)
  int watchersCount;
  @HiveField(57)
  String language;
  @HiveField(58)
  bool hasIssues;
  @HiveField(59)
  bool hasProjects;
  @HiveField(60)
  bool hasDownloads;
  @HiveField(61)
  bool hasWiki;
  @HiveField(62)
  bool hasPages;
  @HiveField(63)
  int forksCount;
  @HiveField(64)
  String mirrorUrl;
  @HiveField(65)
  bool archived;
  @HiveField(66)
  bool disabled;
  @HiveField(67)
  int openIssuesCount;
  @HiveField(68)
  License license;
  @HiveField(69)
  int forks;
  @HiveField(70)
  int openIssues;
  @HiveField(71)
  int watchers;
  @HiveField(72)
  String defaultBranch;

  RepositoryModel(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.forksUrl,
      this.keysUrl,
      this.collaboratorsUrl,
      this.teamsUrl,
      this.hooksUrl,
      this.issueEventsUrl,
      this.eventsUrl,
      this.assigneesUrl,
      this.branchesUrl,
      this.tagsUrl,
      this.blobsUrl,
      this.gitTagsUrl,
      this.gitRefsUrl,
      this.treesUrl,
      this.statusesUrl,
      this.languagesUrl,
      this.stargazersUrl,
      this.contributorsUrl,
      this.subscribersUrl,
      this.subscriptionUrl,
      this.commitsUrl,
      this.gitCommitsUrl,
      this.commentsUrl,
      this.issueCommentUrl,
      this.contentsUrl,
      this.compareUrl,
      this.mergesUrl,
      this.archiveUrl,
      this.downloadsUrl,
      this.issuesUrl,
      this.pullsUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.labelsUrl,
      this.releasesUrl,
      this.deploymentsUrl,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.gitUrl,
      this.sshUrl,
      this.cloneUrl,
      this.svnUrl,
      this.homepage,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.hasIssues,
      this.hasProjects,
      this.hasDownloads,
      this.hasWiki,
      this.hasPages,
      this.forksCount,
      this.mirrorUrl,
      this.archived,
      this.disabled,
      this.openIssuesCount,
      this.license,
      this.forks,
      this.openIssues,
      this.watchers,
      this.defaultBranch});

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    teamsUrl = json['teams_url'];
    hooksUrl = json['hooks_url'];
    issueEventsUrl = json['issue_events_url'];
    eventsUrl = json['events_url'];
    assigneesUrl = json['assignees_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitRefsUrl = json['git_refs_url'];
    treesUrl = json['trees_url'];
    statusesUrl = json['statuses_url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    commitsUrl = json['commits_url'];
    gitCommitsUrl = json['git_commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    contentsUrl = json['contents_url'];
    compareUrl = json['compare_url'];
    mergesUrl = json['merges_url'];
    archiveUrl = json['archive_url'];
    downloadsUrl = json['downloads_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    deploymentsUrl = json['deployments_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
    sshUrl = json['ssh_url'];
    cloneUrl = json['clone_url'];
    svnUrl = json['svn_url'];
    homepage = json['homepage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count'];
    mirrorUrl = json['mirror_url'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    license =
        json['license'] != null ? new License.fromJson(json['license']) : null;
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['private'] = this.private;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['fork'] = this.fork;
    data['url'] = this.url;
    data['forks_url'] = this.forksUrl;
    data['keys_url'] = this.keysUrl;
    data['collaborators_url'] = this.collaboratorsUrl;
    data['teams_url'] = this.teamsUrl;
    data['hooks_url'] = this.hooksUrl;
    data['issue_events_url'] = this.issueEventsUrl;
    data['events_url'] = this.eventsUrl;
    data['assignees_url'] = this.assigneesUrl;
    data['branches_url'] = this.branchesUrl;
    data['tags_url'] = this.tagsUrl;
    data['blobs_url'] = this.blobsUrl;
    data['git_tags_url'] = this.gitTagsUrl;
    data['git_refs_url'] = this.gitRefsUrl;
    data['trees_url'] = this.treesUrl;
    data['statuses_url'] = this.statusesUrl;
    data['languages_url'] = this.languagesUrl;
    data['stargazers_url'] = this.stargazersUrl;
    data['contributors_url'] = this.contributorsUrl;
    data['subscribers_url'] = this.subscribersUrl;
    data['subscription_url'] = this.subscriptionUrl;
    data['commits_url'] = this.commitsUrl;
    data['git_commits_url'] = this.gitCommitsUrl;
    data['comments_url'] = this.commentsUrl;
    data['issue_comment_url'] = this.issueCommentUrl;
    data['contents_url'] = this.contentsUrl;
    data['compare_url'] = this.compareUrl;
    data['merges_url'] = this.mergesUrl;
    data['archive_url'] = this.archiveUrl;
    data['downloads_url'] = this.downloadsUrl;
    data['issues_url'] = this.issuesUrl;
    data['pulls_url'] = this.pullsUrl;
    data['milestones_url'] = this.milestonesUrl;
    data['notifications_url'] = this.notificationsUrl;
    data['labels_url'] = this.labelsUrl;
    data['releases_url'] = this.releasesUrl;
    data['deployments_url'] = this.deploymentsUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pushed_at'] = this.pushedAt;
    data['git_url'] = this.gitUrl;
    data['ssh_url'] = this.sshUrl;
    data['clone_url'] = this.cloneUrl;
    data['svn_url'] = this.svnUrl;
    data['homepage'] = this.homepage;
    data['size'] = this.size;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['language'] = this.language;
    data['has_issues'] = this.hasIssues;
    data['has_projects'] = this.hasProjects;
    data['has_downloads'] = this.hasDownloads;
    data['has_wiki'] = this.hasWiki;
    data['has_pages'] = this.hasPages;
    data['forks_count'] = this.forksCount;
    data['mirror_url'] = this.mirrorUrl;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['open_issues_count'] = this.openIssuesCount;
    if (this.owner != null) {
      data['license'] = this.license.toJson();
    }
    data['forks'] = this.forks;
    data['open_issues'] = this.openIssues;
    data['watchers'] = this.watchers;
    data['default_branch'] = this.defaultBranch;
    return data;
  }
}
