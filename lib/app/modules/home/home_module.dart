import 'package:animated_splash/animated_splash.dart';
import 'package:radix_challenge/app/modules/repositories/repositories_controller.dart';
import 'package:radix_challenge/app/modules/repositories/repositories_page.dart';
import 'package:radix_challenge/app/modules/repository/repository_page.dart';
import 'package:radix_challenge/app/modules/users/users_controller.dart';
import 'package:radix_challenge/app/modules/users/users_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => AnimatedSplash(
            imagePath: 'assets/images/splash.png',
            home: HomePage(),
            duration: 2500,
            type: AnimatedSplashType.StaticDuration,
          ),
        ),
        ModularRouter(
          "/users/:consulta",
          child: (_, args) => UsersPage(
            consulta: args.params['consulta'],
          ),
        ),
        ModularRouter(
          "/repositories/:index",
          child: (_, args) => RepositoriesPage(
            index: args.params['index'],
          ),
        ),
        ModularRouter(
          "/repository/:index",
          child: (_, args) => RepositoryPage(
            index: args.params['index'],
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
