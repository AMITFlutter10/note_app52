
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app52/cash_helper.dart';
import 'package:note_app52/uitlites/colors.dart';
import 'package:note_app52/uitlites/enums.dart';
import 'package:sizer/sizer.dart';

import '../../uitlites/app_route.dart';
import '../widgets/default_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    Timer(
      const Duration(milliseconds: 4000),
          () =>  Navigator.pushNamedAndRemoveUntil(
        context,
        CashHelper.getBool(key: SharedKey.onboarding)?
        AppRoute.login :
        AppRoute.onBoardingScreen,
            (route) => false));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [AppTheme.white , AppTheme.primaryColor, ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'assets/images/1.PNG',
                  height: 30.h,
                  width: 70.w,
                ),
              ),
              DefaultText(
                text: 'welcome',
                fontSize: 30.sp,
                color:  AppTheme.kPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
