import 'package:flutter/material.dart';
import 'package:note_app52/note/note_cubit.dart';
import 'package:note_app52/view/widgets/default_form_field.dart';
import 'package:note_app52/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  var messageController = TextEditingController( );
  var titleController = TextEditingController( );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              DefaultFormField(controller: messageController, keyboardType: TextInputType.text),
              SizedBox(height: 2.h,),
              DefaultFormField(
                  controller: titleController,
                  keyboardType:TextInputType.text
              ),
              SizedBox(height: 2.h,),
              ElevatedButton(onPressed: (){
                NoteCubit.get(context).insertDataBase(message: messageController.text,
                    title: titleController.text);
                Navigator.pushNamed(context, "showNote");
              },
                  child: DefaultText(text: "Sent",

                fontSize: 10.sp,))
            ],),
          )
        ],
      ),
    );
  }
}
