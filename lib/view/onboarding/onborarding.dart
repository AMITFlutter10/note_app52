import 'package:flutter/material.dart';
import 'package:note_app52/cash_helper.dart';
import 'package:note_app52/uitlites/enums.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/onboarding_model.dart';
import '../widgets/default_text.dart';
import 'item_onbarding.dart';



class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {

  bool isLast = false;
   void finishOnBoarding(String screenName){
     CashHelper.putBool(key: SharedKey.onboarding, value: isLast);
     Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
   }

  PageController boardPageController =PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      actions: [
        TextButton(onPressed: (){
          finishOnBoarding("login");
        },
            child:
       const DefaultText(
          text: "Skip",
       ))],),
      body: SizedBox(
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: boardPageController,
                  itemCount: itemOnBoard.length,
                    onPageChanged: (int index){
                    if(index == itemOnBoard.length-1){
                      setState(() {
                        isLast =true;
                      });

                    }else{
                      isLast= false;
                    }
                    },
                    itemBuilder: (context , index)
                    {
                    return onBoardingItem(
                    // onBoardingModel: ,
                      onBoardingModel: itemOnBoard[index],);
                    }
                ),
              ), SmoothPageIndicator(
                    controller: boardPageController,
                    count:  itemOnBoard.length,
                    effect:  const ExpandingDotsEffect(
                     dotColor: Colors.grey,
                     activeDotColor: Colors.teal,
                     dotHeight: 10,
                     dotWidth: 14,
                     spacing: 15,
                   ),
                ),
                Align(
                  alignment: Alignment.topRight,
                    child: Visibility(
                      visible: isLast ,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.teal)
                        ),
                          onPressed:(){
                          finishOnBoarding("login");
                          } ,
                          child:
                          DefaultText(text: "Next",
                          fontSize: 10.sp,)),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
