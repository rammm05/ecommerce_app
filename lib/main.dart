
import 'package:ecommerce_ui/app_routes.dart';
import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_nav_bar.dart';
import 'package:ecommerce_ui/screens/product_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/splash_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/user_on_board/login_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/user_on_board/signup_page_ecommerce_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: BottomNavBar(),
      routes: AppRoutes.mRoutes,
      initialRoute: AppRoutes.SPLASH_PAGE,
    );
  }
}

