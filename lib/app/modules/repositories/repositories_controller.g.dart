// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RepositoriesController = BindInject(
  (i) => RepositoriesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoriesController on _RepositoriesControllerBase, Store {
  final _$repositoriesAtom =
      Atom(name: '_RepositoriesControllerBase.repositories');

  @override
  ObservableFuture<dynamic> get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(ObservableFuture<dynamic> value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  final _$actualRepositoryAtom =
      Atom(name: '_RepositoriesControllerBase.actualRepository');

  @override
  RepositoryModel get actualRepository {
    _$actualRepositoryAtom.reportRead();
    return super.actualRepository;
  }

  @override
  set actualRepository(RepositoryModel value) {
    _$actualRepositoryAtom.reportWrite(value, super.actualRepository, () {
      super.actualRepository = value;
    });
  }

  final _$iClosedIssueAtom =
      Atom(name: '_RepositoriesControllerBase.iClosedIssue');

  @override
  int get iClosedIssue {
    _$iClosedIssueAtom.reportRead();
    return super.iClosedIssue;
  }

  @override
  set iClosedIssue(int value) {
    _$iClosedIssueAtom.reportWrite(value, super.iClosedIssue, () {
      super.iClosedIssue = value;
    });
  }

  final _$getRepoClosedIssuesAsyncAction =
      AsyncAction('_RepositoriesControllerBase.getRepoClosedIssues');

  @override
  Future<void> getRepoClosedIssues(String user, String repo) {
    return _$getRepoClosedIssuesAsyncAction
        .run(() => super.getRepoClosedIssues(user, repo));
  }

  final _$_RepositoriesControllerBaseActionController =
      ActionController(name: '_RepositoriesControllerBase');

  @override
  void getRepoApiByName(String key) {
    final _$actionInfo = _$_RepositoriesControllerBaseActionController
        .startAction(name: '_RepositoriesControllerBase.getRepoApiByName');
    try {
      return super.getRepoApiByName(key);
    } finally {
      _$_RepositoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getRepoLocalStorageByName(String key) {
    final _$actionInfo =
        _$_RepositoriesControllerBaseActionController.startAction(
            name: '_RepositoriesControllerBase.getRepoLocalStorageByName');
    try {
      return super.getRepoLocalStorageByName(key);
    } finally {
      _$_RepositoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
repositories: ${repositories},
actualRepository: ${actualRepository},
iClosedIssue: ${iClosedIssue}
    ''';
  }
}
