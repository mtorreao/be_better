import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class WelcomeUserNameBloc extends BlocBase {
  bool isNameDirty = false;

  final _nameController = BehaviorSubject<String>();
  final _canSubmitController = BehaviorSubject<bool>();

  Stream<String> get outName => _nameController.stream;
  Stream<bool> get outCanSubmit => _nameController.stream
      .map<bool>((nameValue) => validateName(nameValue) == null);

  void inName(String newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      isNameDirty = true;
      _nameController.add(newValue);
    }
  }

  String validateName(String value) {
    if (isNameDirty && value.length < 3 && value.isNotEmpty) {
      return 'Mínimo de 3 caracteres';
    }
    return null;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _nameController.close();
    _canSubmitController.close();
    super.dispose();
  }
}
