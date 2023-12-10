import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app52/note/note_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/default_text.dart';
import 'edit_note.dart';

class BuilderItem extends StatelessWidget {
  Map item ;
   BuilderItem({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (dismissed){
          NoteCubit.get(context).deleteDataBase(id: item['id'] );
          Fluttertoast.showToast(
              msg: "Deleted",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
        child: InkWell(
          onTap: (){
            Fluttertoast.showToast(
                msg: "Long touch for note editing, Swipe left or right to delete,",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          onLongPress: (){
           showDialog(
              context: context,
              builder: (context)=>EditNote(items: item,) );
          },
        child: Container(
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300]
            ),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  DefaultText(text: item['title'],
                   fontSize: 15.sp,
                    color: Colors.black,
                  ) ,
                  SizedBox(height: 1.h,),
                  DefaultText(text:item['noteMessage'],
                    fontSize: 15.sp,
                    color: Colors.black,
                  ) ,
                ],
              ),
            Visibility(
              visible: item['favorite']=="true" ,
                replacement:  IconButton(onPressed: (){
                  NoteCubit.get(context).updateFavorite(id: item['id'],
                  favorite: "true"
                  );
                }, icon: Icon(Icons.star, color: Colors.grey,)) ,
                child:   IconButton(onPressed: (){
                  NoteCubit.get(context).updateFavorite(id: item['id'],
                      favorite: "false"
                  );
                }, icon: Icon(Icons.star, color: Colors.yellow,)))
            ],),
          ),
        ),
      ),
    );
  }
}
