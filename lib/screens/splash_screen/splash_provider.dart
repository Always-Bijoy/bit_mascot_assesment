import 'package:erp/screens/auth/login/login_screen.dart';
import 'package:flutter/foundation.dart';

import '../../utils/nav_utail.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider(context) {
    initFunction(context);
  }

  initFunction(context) {
    Future.delayed(const Duration(seconds: 2), () async {
      NavUtil.replaceScreen(context, const LoginScreen());
    });
  }
}
