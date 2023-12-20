import 'package:erp/screens/auth/login/login_provider.dart';
import 'package:erp/screens/splash_screen/splash_screen.dart';
import 'package:erp/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  /// for play store and app store update dialog
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.colorPrimary
    ..backgroundColor = Colors.transparent
    ..indicatorColor = AppColors.colorPrimary
    ..textColor = AppColors.colorPrimary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        title: 'ERP',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
        },
        theme: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppColors.colorPrimary,
              ),
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}
