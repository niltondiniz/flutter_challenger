// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<RepoApiRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$repositoriosAtom = Atom(name: '_HomeControllerBase.repositorios');

  @override
  ObservableFuture<dynamic> get repositorios {
    _$repositoriosAtom.reportRead();
    return super.repositorios;
  }

  @override
  set repositorios(ObservableFuture<dynamic> value) {
    _$repositoriosAtom.reportWrite(value, super.repositorios, () {
      super.repositorios = value;
    });
  }

  @override
  String toString() {
    return '''
repositorios: ${repositorios}
    ''';
  }
}
