import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app52/auth/auth_cubit.dart';
import 'package:note_app52/note/note_cubit.dart';
import 'package:note_app52/theme/themes_cubit.dart';
import 'package:note_app52/utilities/app_route.dart';
import 'package:note_app52/utilities/route.dart';
import 'package:note_app52/utilities/theme_app.dart';
import 'package:note_app52/view/screen/setting.dart';
import 'package:sizer/sizer.dart';
import 'cash_helper.dart';
import 'firebase_options.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CashHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => NoteCubit()),
        BlocProvider(create: (_) => ThemesCubit()),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return BlocBuilder<ThemesCubit, ThemesState>(
            builder: (context, state) {
              ThemesCubit.get(context).getTheme();
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemesCubit.get(context).isDark
                    ? Themes.darkTheme
                    : Themes.lightTheme,
                // home: const SettingsPage(),
                onGenerateRoute:onGenerateRoute ,
                initialRoute:  AppRoute.splash,
              );
            },
          );
        },
      ),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key,});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//    sendData(){
//      firebaseFirestore.collection("notes").add(
//          {
//            'note' : noteController.text
//          }).then((value) {
//            print(value);
//         });
//    }
//
//    getData(){
//      firebaseFirestore.collection("notes").snapshots();
//    }
//
//
// var noteController =TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: noteController,
//               decoration: InputDecoration(
//                 hintText: " enter your note "
//               ),
//             ),
//             ElevatedButton(onPressed: (){
//               sendData();
//             }, child: Text("Sent")),
//             Divider(thickness: 1,),
//             StreamBuilder<QuerySnapshot>
//               (stream: firebaseFirestore.collection("notes").snapshots(),
//                 builder: (context, snapshot){
//                 return snapshot.hasData ? snapshot.data!.docs.length !=0 ?
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index){
//                       return Center(
//                       child:  Text(
//                          snapshot.data!.docs[index]['note']
//                         )
//                       );
//                     }):
//                     Center(child:  Text("no data"),) :
//                     snapshot.hasError ? Center(child:  Text("error happend"),):
//                     Center(
//                       child: CircularProgressIndicator(),
//                     );
//
//                 })
//
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
