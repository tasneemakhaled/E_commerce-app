import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project_fcii/core/routing/my_route.dart';
import 'package:project_fcii/features/auth/Reset/reset_password.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: DashboardPage(),
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
    onGenerateRoute: MyRoutes.onGenerateRoute,
  );
  runApp(materialApp);
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
//   bool onBoarding = sharedPrefrences.getBool('onboarding') ?? true;

//   MaterialApp materialApp = MaterialApp(
//     builder: DevicePreview.appBuilder,
//     debugShowCheckedModeBanner: false,
//     useInheritedMediaQuery: true,
//     onGenerateRoute: MyRoutes.onGenerateRoute,
//     onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
//   );
//   runApp(
//     DevicePreview(
//       enabled: false,
//       builder: (context) => materialApp, // Wrap your app
//     ),
//   );

