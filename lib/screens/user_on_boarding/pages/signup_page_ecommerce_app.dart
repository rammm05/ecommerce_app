import 'package:ecommerce_ui/domain/constants/app_routes.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_bloc.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_event.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

  bool isLoading = false;

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

              BlocConsumer<UserBloc, UserState>(
                listener: (context, state){

                  if(state is UserLoadingState){
                    isLoading = true;
                  }

                  if(state is UserFailureState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errMsg),backgroundColor: Colors.red,));
                  }

                  if(state is UserSuccessState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Successfully Registered"),
                      backgroundColor: Colors.green,));

                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar));
                    Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD_BOTTOM_NAV_PAGE);

                  }

                },
                builder: (context, state) {

                    return SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {

                            BlocProvider.of<UserBloc>(context).add(UserRegisterEvent(
                                name: userNameController.text,
                                email: emailController.text,
                                pass: createPassController.text,
                                mobNo: phoneController.text
                            ));

                            /*ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Account created successfully"),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD_BOTTOM_NAV_PAGE);*/
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade900,
                        ),
                        child: !isLoading ? Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ) : CircularProgressIndicator() ,
                      ),
                    );
                }
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
