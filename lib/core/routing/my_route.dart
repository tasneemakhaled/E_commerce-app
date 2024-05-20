import 'package:flutter/material.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/onboarding/view/page/onbording_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:project_fcii/features/dashboard/modules/new_product/view/page/new_product_page.dart';
import 'package:project_fcii/features/dashboard/view/page/dashboard_page.dart';

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (_) => const DashbordPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DashbordPage(),
        );
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginPage(
            username: '',
          ),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RegisterationPage(),
        );
      case 'new_product':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const NewProductPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnbordingPage(),
        );
    }
  }
}
