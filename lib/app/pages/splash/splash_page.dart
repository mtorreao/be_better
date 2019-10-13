import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SvgPicture.asset(
            'assets/be_better_logo.svg',
            semanticsLabel: 'App logo',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
