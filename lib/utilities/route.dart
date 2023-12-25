
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app52/utilities/app_route.dart';
import 'package:note_app52/view/screen/home_page.dart';
import 'package:note_app52/view/screen/login_page.dart';
import 'package:note_app52/view/screen/register_page.dart';
import 'package:note_app52/view/splash/splash_screen.dart';

import '../view/onboarding/onborarding.dart';
import '../view/screen/show_screen.dart';

Route<dynamic>? onGenerateRoute (RouteSettings routeSettings){
  switch(routeSettings.name){
    case AppRoute.splash : return MaterialPageRoute(builder: (_)=>const SplashScreen());
    case AppRoute.onboarding : return MaterialPageRoute(builder: (_)=> const OnBoarding());
    case AppRoute.home : return MaterialPageRoute(builder: (_)=> HomePage());
    case AppRoute.register : return MaterialPageRoute(builder: (_)=>const RegisterScreen());
    case AppRoute.login : return MaterialPageRoute(builder: (_)=>const LoginScreen());
    case AppRoute.showNote : return MaterialPageRoute(builder: (_)=>const ShowNote());
    //default :
  }

}