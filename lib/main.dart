
import 'package:ecommerce_ui/data/remote/helper/api_helper.dart';
import 'package:ecommerce_ui/domain/constants/app_routes.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context)=> UserBloc(apiHelper: ApiHelper()),
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:  ColorScheme.fromSeed(seedColor: Colors.amber)
      ),
      //home: BottomNavBar(),
      routes: AppRoutes.mRoutes,
      initialRoute: AppRoutes.SPLASH_PAGE,
    );
  }
}

