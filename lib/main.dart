import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project_fcii/features/auth/Reset/reset_password.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPrefrences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: onBoarding
    //     ? const LoginPage(
    //         username: '',
    //       )
    // : const OnbordingPage(),
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
  );
  runApp(materialApp);
}

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const OnbordingPage(),
    ),
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const RegisterationPage(),
    ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final String data = settings.arguments as String;
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const LoginPage(
            username: 'tas',
          ),
        );
      case 'registration':
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const RegisterationPage(),
        );
      case 'Reset':
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const ResetPassword(),
        );
      default:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const OnbordingPage(),
        );
    }
  }
}
