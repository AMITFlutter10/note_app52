import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);
  // createDataBase() {
  //  getDataBase();
  // }
  FirebaseFirestore store = FirebaseFirestore.instance;

  insertDataBase({required String message, required String title}) async {
    int uniqueId = DateTime.now().millisecondsSinceEpoch;
    await store.collection("note").doc(uniqueId.toString()).set({
      "noteMessage": message,
      "title": title,
      "id": uniqueId,
      "favorite": "false"
    }).then((value) {
      emit(InsertDataSuccess());
      print(" add note ");
    }).catchError((error) {
      emit(InsertDataError());
      print(error);
    });
  }

  List noteList = [];
  List favoriteList = [];

  getDataBase() async {
    emit(LoadingGetData());
    await store.collection("note").get().then((value) {
      for (QueryDocumentSnapshot<Map<String ,dynamic>> element in value.docs) {

        noteList.add(element.data());
        if (element["favorite"] == "true") {
          favoriteList.add(element);
        }
      }
      emit(GetDataSuccess());
    }).catchError((error){
      emit(GetDataError());
    });
  }

  updateDataBase({
    required String message,
    required String title,
    required int id,
  })async {
     await store.collection("note").doc(id.toString()).update({
       "noteMessage": message,
       "title": title,
       "id": id,
     }).then((value) {
       emit(UpdateDataSuccess());
       print("update");
     }).catchError((error){
       emit(UpdateDataError());
     });
  }

  updateData({
     String? message,
     String? title,
    required int id,
  })async {
    await store.collection("note").doc(id.toString()).update({
      "noteMessage": message,
      "title": title,
      "id": id,
    }).then((value) {
      emit(UpdateDataSuccess());
      print("update");
    });
  }
  updateFavorite({
    String? favorite,
    required int id,
  })async {
    await store.collection("note").doc(id.toString()).update({
      "favorite":favorite ,
       "id" : id
    }).then((value) {
      print("update");
    });


  }


  deleteDataBase({required int id})async{
    await store.collection("note").doc(id.toString()).delete().then((value) {
      emit(DeleteDataSuccess());
    }).catchError((error) {
      emit(DeleteDataError());
    });
  }
}