import 'package:ecommerce_ui/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageEcommerceApp extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isPassVisible = false;

  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan.shade200,
      appBar: AppBar(
        title: Text(
          "RapidCart!",
          style: TextStyle(
            color: Colors.orange.shade900,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: 130),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!emailRegExp.hasMatch(value) && value.length != 10) {
                    return "Please enter a valid email or phone number";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepOrange.shade100,
                  hint: Text(
                    "Phone number or email address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              StatefulBuilder(
                builder: (context, ss) {
                  return TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isPassVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepOrange.shade100,
                      suffixIcon: InkWell(
                        onTap: () {
                          isPassVisible = !isPassVisible;
                          ss(() {});
                        },
                        child: Icon(
                          !isPassVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hint: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "Forgotten password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Login successful"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD_BOTTOM_NAV_PAGE);
                    }
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade900,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.SIGN_UP_PAGE);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
