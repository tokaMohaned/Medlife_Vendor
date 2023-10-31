import 'package:flutter/material.dart';
import 'package:medlife_v2/features/auth/ui/screens/login_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/register_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/reset_password_screen.dart';
import 'package:medlife_v2/features/home/ui/screens/home_screen.dart';
import 'package:medlife_v2/features/orders/ui/screens/delivered_order_details.dart';
import 'package:medlife_v2/features/orders/ui/screens/new_order_details.dart';
import 'package:medlife_v2/features/orders/ui/screens/current_order_details.dart';
import 'package:medlife_v2/features/profile/ui/screens/profile_screen.dart';
import 'package:medlife_v2/ui/screens/home_layout.dart';
import 'package:medlife_v2/ui/screens/splash_screen.dart';

class Routes {
  static const String layout = "/layout";
  static const String splash = "/splashScreen";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String home = "/home";
  static const String currentRequestDetails = "/currentRequestDetails";
  static const String newRequestDetails = "/newRequestDetails";
  static const String completedRequestDetails = "/completedRequestDetails";
  static const String profile = "/profile";
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.layout:
      return MaterialPageRoute(
        builder: (_) => const HomeLayout(),
      );
    case Routes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case Routes.resetPassword:
      return MaterialPageRoute(
        builder: (_) => const ResetPasswordScreen(),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case Routes.currentRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CurrentOrderDetails(),
      );
    case Routes.newRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NewOrderDetails(),
      );
    case Routes.completedRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DeliveredOrderDetails(),
      );
    case Routes.profile:
      return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      );
    default:
      return null;
  }
}
