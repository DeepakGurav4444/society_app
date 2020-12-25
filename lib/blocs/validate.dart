import 'dart:async';

mixin Validators {
  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (mobile.isEmpty) {
      sink.addError("Enter Mobile");
    } else if (mobile.length == 10) {
      sink.add(mobile);
    } else {
      sink.addError("Enter valid mobile number");
    }
  });
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp emailReg =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+");
    if (email.isEmpty) {
      sink.addError("Enter Email");
    } else if (emailReg.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Enter valid Email");
    }
  });
  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      sink.addError("Enter Name");
    } else if (name.length > 4) {
      sink.add(name);
    } else {
      sink.addError("Enter valid Name");
    }
  });
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) {
      sink.addError("Enter Password");
    } else if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password should be at least 4 characters long");
    }
  });
}
