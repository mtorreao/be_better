import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class WelcomeUserNameBloc extends BlocBase {
  final nameTextController = TextEditingController();

  bool isNameDirty = false;

  final _nameController = BehaviorSubject<String>();

  Stream<String> get outName => _nameController.stream;

  void inName(String newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      isNameDirty = true;
      validateName();

      _nameController.add(newValue);
    }
  }

  void validateName() {
    final value = _nameController.value;

    if (isNameDirty && value.length < 3) {
      _nameController.addError('Mínimo de 3 caracteres');
    } else {
      _nameController.addError(null);
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    nameTextController.dispose();
    _nameController.close();
    super.dispose();
  }
}
