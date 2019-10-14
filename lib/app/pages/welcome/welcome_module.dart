import 'package:be_better/app/pages/welcome/welcome_user_name/welcome_user_name_bloc.dart';
import 'package:be_better/app/pages/welcome/welcome_user_name/welcome_user_name_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class WelcomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => WelcomeUserNameBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => WelcomeUserNamePage();

  static Inject get to => Inject<WelcomeModule>.of();
}
