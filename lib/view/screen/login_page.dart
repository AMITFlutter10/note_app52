import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app52/auth/auth_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../uitlites/app_route.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    // double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (BuildContext context, state) {
          return Scaffold(
              body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: h * 0.52,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(130),
                                    topRight: Radius.circular(150),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: DefaultText(
                                 text: "Login",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120, left: 60),
                                child: Center(
                                  child: Container(
                                    height: 250,
                                    width: 270,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3) // Shadow position
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(130),
                                        topRight: Radius.circular(90),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          DefaultFormField(
                                            hintText: "email",
                                            keyboardType: TextInputType.emailAddress,
                                            controller: emailController,
                                            // prefix: Icon(Icons.email),,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Email cannot be empty ";
                                              }
                                              if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                                                  .hasMatch(value)) {
                                                return ("please enter valid email");
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          DefaultFormField(
                                            hintText:  " password",
                                              keyboardType: TextInputType.visiblePassword,
                                              controller: passwordController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Password cannot be empty";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              await cubit.login(
                                                  email: emailController.text,
                                                  password: passwordController.text);
                                              Navigator.pushNamedAndRemoveUntil(context, AppRoute.home, (route) => false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:const StadiumBorder(),
                                                minimumSize: const Size(40, 40)),
                                            child: DefaultText(
                                              text: "Login",
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                DefaultText(
                                  text: " create new account",
                                fontSize: 8.sp,
                                ),
                                InkWell(
                                  onTap: () {
                                  Navigator.pushNamed(context, AppRoute.register);},
                                  child: DefaultText(
                                    text: "Register",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.sp,
                                 ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
        });
  }
}
