import 'package:ecommerce_ui/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPageEcommerceApp extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var createPassController = TextEditingController();
  var confirmPassController = TextEditingController();

  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  bool isPassVisible = false;
  bool isConfirmPassVisible = false;

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
              SizedBox(height: 60),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  } else {
                    return null;
                  }
                },
                controller: userNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepOrange.shade100,
                  hint: Text(
                    "Username",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!emailRegExp.hasMatch(value)) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepOrange.shade100,
                  hint: Text(
                    "Email address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  } else if (value.length != 10) {
                    return "Please enter a valid phone number";
                  } else {
                    return null;
                  }
                },
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepOrange.shade100,
                  hint: Text(
                    "Phone number",
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
                      } else if (!passwordRegex.hasMatch(value)) {
                        return "Password must contain atleast 1 uppercase character,\n1 lower case character,\n1 digit (number),\n1 special character.";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isPassVisible,
                    controller: createPassController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepOrange.shade100,
                      hint: Text(
                        "Create password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      border: OutlineInputBorder(),
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
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              StatefulBuilder(
                builder: (context, ss) {
                  return TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm your password";
                      } else if (value != createPassController.text) {
                        return "Password doesn't match";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !isConfirmPassVisible,
                    controller: confirmPassController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.deepOrange.shade100,
                      hint: Text(
                        "Confirm password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          isConfirmPassVisible = !isConfirmPassVisible;
                          ss(() {});
                        },
                        child: Icon(
                          !isConfirmPassVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  );
                },
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
                          content: Text("Account created successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      
                      Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD_BOTTOM_NAV_PAGE);
                    }
                  },
                  child: Text(
                    "Sign up",
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
                  Text("Back to ", style: TextStyle(fontSize: 20)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
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
