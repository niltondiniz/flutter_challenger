// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UsersController = BindInject(
  (i) => UsersController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersController on _UsersControllerBase, Store {
  final _$usersAtom = Atom(name: '_UsersControllerBase.users');

  @override
  ObservableFuture<dynamic> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableFuture<dynamic> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$actualUserAtom = Atom(name: '_UsersControllerBase.actualUser');

  @override
  UserModel get actualUser {
    _$actualUserAtom.reportRead();
    return super.actualUser;
  }

  @override
  set actualUser(UserModel value) {
    _$actualUserAtom.reportWrite(value, super.actualUser, () {
      super.actualUser = value;
    });
  }

  final _$valueAtom = Atom(name: '_UsersControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_UsersControllerBaseActionController =
      ActionController(name: '_UsersControllerBase');

  @override
  void getUsersApiByName(String key) {
    final _$actionInfo = _$_UsersControllerBaseActionController.startAction(
        name: '_UsersControllerBase.getUsersApiByName');
    try {
      return super.getUsersApiByName(key);
    } finally {
      _$_UsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUserLocalStorageByName(String key) {
    final _$actionInfo = _$_UsersControllerBaseActionController.startAction(
        name: '_UsersControllerBase.getUserLocalStorageByName');
    try {
      return super.getUserLocalStorageByName(key);
    } finally {
      _$_UsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllStored() {
    final _$actionInfo = _$_UsersControllerBaseActionController.startAction(
        name: '_UsersControllerBase.getAllStored');
    try {
      return super.getAllStored();
    } finally {
      _$_UsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_UsersControllerBaseActionController.startAction(
        name: '_UsersControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_UsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
actualUser: ${actualUser},
value: ${value}
    ''';
  }
}
