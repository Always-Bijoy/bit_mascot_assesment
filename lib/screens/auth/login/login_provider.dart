import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  var emailOrPhoneTextController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordVisible = true;
  final formKey = GlobalKey<FormState>();

  LoginProvider() {
    passwordVisible = false;
  }

  passwordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}
