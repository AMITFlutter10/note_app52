import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app52/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
 static AuthCubit get(context)=>BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  UserModel userModel = UserModel();
  GoogleSignIn googleSignIn  = GoogleSignIn();


   registerByEmailAndPassword({required String email,
     required String password , required  String name })async{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
     userModel.email = email;
     userModel.password =password;
     userModel.name = name;
     userModel.id = userCredential.user!.uid;  // 76hyi
     //userModel.pic
     await store.collection("users").doc(userModel.id).set(userModel.toMap());
   }


    login({required String email ,required String password})async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
    }


    registerByGoogle()async{
     GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
     GoogleSignInAuthentication? googleSignInAuthentication =
     await googleSignInAccount!.authentication ;
     AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken ,
      accessToken: googleSignInAuthentication.accessToken,
     );
     var user =await auth.signInWithCredential(authCredential);
      userModel.id = user.user!.uid;
       userModel.name= user.user!.displayName;
        userModel.email = user.user!.email;
        userModel.pic = user.user!
            .photoURL ;
        await store.collection("users").doc(userModel.id).set(userModel.toMap());

    }

 List users =[];
   
    
     getAllUser()async{
    // var userWithMe = await store.collection("users").get();
    // userWithMe.docs.forEach((element) {
    //  users.add(UserModel.fromMap(element.data()));
    //  print(users);
      var userWithoutMe = await store.collection("users").where(
          "id", isNotEqualTo:userModel.id ).get();
      userWithoutMe.docs.forEach((element) {
       users.add(UserModel.fromMap(element.data()));
       print(users);
    });
     }
    

}
