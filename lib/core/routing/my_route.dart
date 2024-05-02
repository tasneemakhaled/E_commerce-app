import 'package:flutter/material.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:project_fcii/features/dashboard/view/page/dashboard_page.dart';

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (_) => const DashbordPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DashbordPage(),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RegisterationPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnbordingPage(),
        );
    }
  }
}
