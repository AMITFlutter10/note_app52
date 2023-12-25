import 'package:flutter/material.dart';
import 'package:note_app52/note/note_cubit.dart';
import 'package:note_app52/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_form_field.dart';

class EditNote extends StatelessWidget {
  Map items;
   EditNote({super.key,required this.items});

  var titleController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Container(
        padding: EdgeInsets.all(1.h),
       height: 30.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            DefaultFormField(
              controller:titleController ,
              keyboardType: TextInputType.text,
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white24)
              ),


            ),
            SizedBox(height: 1.h,),
            DefaultFormField(
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white24),),
              controller: messageController, keyboardType:TextInputType.text,),
 Row(
   children: [
       TextButton(onPressed: (){
         NoteCubit.get(context).updateDataBase(
             message: messageController.text,
             title: titleController.text,
             id: items["id"]);
         Navigator.pop(context);
       }, child: DefaultText(text: "Save",)),
       TextButton(onPressed: (){
         Navigator.pop(context);
       }, child: DefaultText(text: "Cancel",))
   ],
 )
          ],
        )
      ),
    );
  }
}
