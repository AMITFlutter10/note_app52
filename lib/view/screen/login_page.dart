import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app52/auth/auth_cubit.dart';
import 'package:note_app52/cash_helper.dart';
import 'package:note_app52/utilities/enums.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_route.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: CashHelper.getString(key: SharedKey.email));
  TextEditingController passwordController = TextEditingController(text: CashHelper.getString(key: SharedKey.password));
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
                                  color: Colors.purple,
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
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Padding(
                                padding:  EdgeInsets.only(top: 15.h,left: 6.h),
                                child: Center(
                                  child: Container(
                                    height: 35.h,
                                    width: 85.w,
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
                                            height: 7.h,
                                            inputBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide:const  BorderSide(color: Colors.grey)
                                            ),
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
                                              height: 7.h,
                                              inputBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide:const  BorderSide(color: Colors.grey)
                                              ),
                                            hintText:  "Password",
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
                                            height: 3.h,
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              await cubit.login(
                                                  email: emailController.text,
                                                  password: passwordController.text);
                                              CashHelper.putString(key: SharedKey.email, value: emailController.text);
                                              CashHelper.putString(key: SharedKey.password, value: passwordController.text);

                                              Navigator.pushNamedAndRemoveUntil(context, AppRoute.home, (route) => false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:const StadiumBorder(),
                                                minimumSize: const Size(50, 40)),
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
                            height: 6.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                DefaultText(
                                  text: "Create new account",
                                fontSize: 11.sp,
                                ),
                                InkWell(
                                  onTap: () {
                                  Navigator.pushNamed(context, AppRoute.register);},
                                  child: DefaultText(
                                    text: "Register",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      color: Colors.purple,
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
