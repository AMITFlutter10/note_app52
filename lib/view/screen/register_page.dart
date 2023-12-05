
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../auth/auth_cubit.dart';
import '../../uitlites/app_route.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool? isPassword;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // ChatCubit Cubit = ChatCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // if(state is PicImageSuccessStorageStates){
        //   const CustomSnackBar.error(message: "Success Save");
        // }
      },
      builder: (context, states) => Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: w,
                  height: h * 0.73,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      // bottomRight: Radius.circular(50),
                      // topLeft: Radius.circular(50),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                           text: "Register",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                          ),

                           SizedBox(
                            height: 3.h,
                          ),
                          DefaultFormField(
                              labelText: "userName",
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty ";
                                } else {
                                  return null;
                                }
                              }),
                           SizedBox(
                            height: 1.h,
                          ),
                          DefaultFormField(
                              labelText: "email",
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              // prefix: Icon(Icons.email),
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
                              }),
                           SizedBox(
                            height: 2.h,
                          ),
                          DefaultFormField(
                            labelText: "password",
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                          ),
                           SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            width: w * .5,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await AuthCubit.get(context).registerByEmailAndPassword
                                    (email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Successfully Register.You Can Chat Now'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                  await Navigator.pushReplacementNamed(
                                      context,"login");
                                }},
                              style: ElevatedButton.styleFrom(
                                //primary: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child:
                              DefaultText(
                                text:"Register",
                              fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GoogleAuthButton(
                                onPressed: ()  async{
                                  await  AuthCubit.get(context).registerByGoogle();
                                  Navigator.pushReplacementNamed(
                                      context,"Home");
                                },
                                style: const AuthButtonStyle(
                                  buttonType: AuthButtonType.icon,
                                  iconType: AuthIconType.secondary,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              FacebookAuthButton(
                                onPressed: () {},
                                style: const AuthButtonStyle(
                                  //textStyle: TextStyle(color: Colors.black12),
                                    buttonType: AuthButtonType.icon,
                                    iconType: AuthIconType.secondary),
                              )
                            ],
                          ),
                           SizedBox(
                            height: 2.h,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                  await AuthCubit.get(context).image("cam");
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                ),

                              child: DefaultText(
                                text:"Register",
                                color: Colors.white,
                                fontSize: 8.sp,

                              ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      DefaultText(
                       text: "have_account",
                       color: Colors.white,
                        fontSize: 10.sp,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.login);
                           Navigator.pushReplacementNamed(
                              context,"login");
                        },
                        child: DefaultText(
                          text: "Login",
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: Colors.white
                          ),
                        ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )),
      ),
    );
  }
}
