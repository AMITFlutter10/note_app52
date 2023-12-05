import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class BuilderItem extends StatelessWidget {
  Map item ;
   BuilderItem({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Column(
          children: [
            DefaultText(text: item['title']) ,
            SizedBox(height: 2.h,),
            DefaultText(text:item['noteMessage']) ,
          ],
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.star))
      ],),
    );
  }
}
