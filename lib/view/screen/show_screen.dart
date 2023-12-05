import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app52/note/note_cubit.dart';
import 'package:sizer/sizer.dart';
import '../widgets/default_text.dart';
import 'builder_item.dart';



class ShowNote extends StatefulWidget {
  const ShowNote({super.key});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  @override
  void initState() {
    NoteCubit.get(context).getDataBase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          if(state is LoadingGetData){
            CircularProgressIndicator();
          }
          else if(state is  GetDataError){
            DefaultText(text: "no data ");
          }
        },
        builder: (context, state) {
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
              itemCount: NoteCubit.get(context).noteList.length,
              itemBuilder: (context, index) {
                return BuilderItem(
                  item: NoteCubit.get(context).noteList[index],
                );
              });
        },
      ),
    );
  }
}
