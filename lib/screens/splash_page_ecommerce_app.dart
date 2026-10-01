import 'dart:async';

import 'package:ecommerce_ui/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPageEcommerceApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_PAGE);

    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RapidCart!",
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text("Order & get your products at Rapid Speed!", style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
