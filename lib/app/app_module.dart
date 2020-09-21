import 'package:radix_challenge/app/modules/users/users_controller.dart';

import 'modules/repositories/repositories_controller.dart';
import 'package:radix_challenge/app/shared/repositories/api/repo_api_repository.dart';
import 'package:radix_challenge/app/shared/repositories/api/user_api_repository.dart';
import 'package:radix_challenge/app/shared/repositories/local_storage/repo_repository_local_storage_repository.dart';
import 'package:radix_challenge/app/shared/repositories/local_storage/user_repository_local_storage_repository.dart';
import 'package:radix_challenge/app/shared/util/constants.dart';
import 'package:dio/dio.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:radix_challenge/app/app_widget.dart';
import 'package:radix_challenge/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $RepositoriesController,
        $AppController,
        $UserApiRepository,
        $RepoApiRepository,
        $UserLocalStorageRepository,
        $RepoLocalStorageRepository,
        $UsersController,
        $RepositoriesController,
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE, connectTimeout: 8000))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
