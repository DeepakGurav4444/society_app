import 'dart:async';
import 'package:society_app/blocs/validate.dart';
import 'basebloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginSignUpBloc extends Object with Validators implements BaseBloc {
  final _mobileController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  Function(String) get mobileChanged=>_mobileController.sink.add;
  Function(String) get nameChanged=>_nameController.sink.add;
  Function(String) get emailChanged=>_emailController.sink.add;
  Function(String) get passwordChanged=>_passwordController.sink.add;
  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  Stream<bool> get registerSubmitCheck =>
      Rx.combineLatest3(name, email, password, (a, b, c) => true);
  Stream<bool> get loginSubmitCheck=>mobile.map((mobile) => true);
  @override
  void dispose() {
    _mobileController?.close();
    _nameController?.close();
    _passwordController?.close();
    _emailController?.close();
  }
}