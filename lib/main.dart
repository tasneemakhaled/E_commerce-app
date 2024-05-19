import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project_fcii/core/cubit/parent_cubit.dart';
import 'package:project_fcii/core/my_theme.dart';
import 'package:project_fcii/features/auth/Reset/reset_password.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// main method
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPrefrences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
    theme: MyTheme.instance.light,
    darkTheme: MyTheme.instance.dark,
    themeMode: ParentCubit.instance.themeMode,
    builder: DevicePreview.appBuilder,
    debugShowCheckedModeBanner: false,
    useInheritedMediaQuery: true,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => materialApp, // Wrap your app
    ),
  );
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
