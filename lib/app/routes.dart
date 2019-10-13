import 'package:flutter/material.dart';
import 'package:be_better/app/pages/home/home_module.dart';
import 'package:be_better/app/pages/login/login_module.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routeMain() {
    return {
      '/': (context) => LoginModule(),
      '/home': (context) => HomeModule()
    };
  }
}
