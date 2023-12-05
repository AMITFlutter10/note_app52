
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app52/uitlites/app_route.dart';
import 'package:note_app52/view/screen/home_page.dart';
import 'package:note_app52/view/screen/login_page.dart';
import 'package:note_app52/view/screen/register_page.dart';

import '../view/screen/show_screen.dart';

Route<dynamic>? onGenerateRoute (RouteSettings routeSettings){
  switch(routeSettings.name){
    case AppRoute.home : return MaterialPageRoute(builder: (_)=> HomePage());
    case AppRoute.register : return MaterialPageRoute(builder: (_)=> RegisterScreen());
    case AppRoute.login : return MaterialPageRoute(builder: (_)=> LoginScreen());
    case AppRoute.showNote : return MaterialPageRoute(builder: (_)=> ShowNote());
    //default :
  }

}