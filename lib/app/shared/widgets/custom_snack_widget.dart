import 'package:flutter/material.dart';

class CustomSnackWidget extends SnackBar {
  final String message;

  CustomSnackWidget(this.message)
      : super(content: Text(message), backgroundColor: Colors.green);
}
