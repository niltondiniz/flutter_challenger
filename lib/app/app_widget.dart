import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:radix_challenge/app/shared/util/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blueGrey);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Radix Challenge',
      theme: myTheme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
