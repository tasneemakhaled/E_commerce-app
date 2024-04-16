import 'package:flutter/material.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPrefrences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: onBoarding ? const LoginPage() : const OnbordingPage(),
  );
  runApp(materialApp);
}
