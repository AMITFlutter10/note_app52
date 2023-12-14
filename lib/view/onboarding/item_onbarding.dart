import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/onboarding_model.dart';
import '../widgets/default_text.dart';

class onBoardingItem extends StatelessWidget {
  OnBoardingModel? onBoardingModel;

  onBoardingItem({super.key,required this.onBoardingModel});
  @override
  Widget build(BuildContext context) {
    return
      // Container(
      //   height: 200,
      //   width: 300,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(onBoardingModel!.image),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // );
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(onBoardingModel!.image , fit: BoxFit.cover,),
          const SizedBox(height: 10,),
          DefaultText(text: onBoardingModel!.disc ,fontSize: 15.sp,
            )
        ],
      );
  }
}
