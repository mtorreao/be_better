import 'package:be_better/app/pages/home/home_module.dart';
import 'package:be_better/app/pages/splash/splash_page.dart';
import 'package:be_better/app/pages/welcome_user_name/welcome_user_name_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const WELCOME_USER_NAME = '/welcome_user_name';
  static const HOME = '/home';
}

class AppRoutes {
  Map<String, WidgetBuilder> routeMain() {
    return {
      '/': (context) => SplashPage(),
      Routes.HOME: (context) => HomeModule(),
      Routes.WELCOME_USER_NAME: (context) => WelcomeUserNamePage(),
    };
  }
}
