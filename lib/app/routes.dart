import 'package:be_better/app/pages/home/home_module.dart';
import 'package:be_better/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routeMain() {
    return {
      '/': (context) => SplashPage(),
      '/home': (context) => HomeModule()
    };
  }
}
