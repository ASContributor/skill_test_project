import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/business/authBloc/auth_bloc.dart';
import 'package:skill_test_project/presentation/Screen/landing_page.dart';
import 'package:skill_test_project/presentation/login_screen.dart';

class appRoutes {
  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) => const loginScreen(), settings: settings);
    } else if (settings.name == 'landingpage/') {
      return MaterialPageRoute(
          builder: (context) => landingPage(), settings: settings);
    }
    return null;
  }
}
