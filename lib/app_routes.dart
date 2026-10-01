import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_nav_bar.dart';
import 'package:ecommerce_ui/screens/product_detail_page.dart';
import 'package:ecommerce_ui/screens/splash_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/user_on_board/login_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/user_on_board/signup_page_ecommerce_app.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String SPLASH_PAGE = "/";
  static const String LOGIN_PAGE = "/login";
  static const String SIGN_UP_PAGE = "/signup";
  static const String DASHBOARD_BOTTOM_NAV_PAGE = "/dashboard";
  static const String PRODUCT_PAGE = "/product_page";

  static Map<String, WidgetBuilder> mRoutes = {
    SPLASH_PAGE: (context) => SplashPageEcommerceApp(),
    LOGIN_PAGE: (context) => LoginPageEcommerceApp(),
    SIGN_UP_PAGE: (context) => SignupPageEcommerceApp(),
    DASHBOARD_BOTTOM_NAV_PAGE: (context) => BottomNavBar(),
    PRODUCT_PAGE: (context) => ProductPageEcommerceApp(),
  };
}
