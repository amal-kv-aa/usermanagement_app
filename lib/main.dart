import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_mgt/firebase_options.dart';
import 'package:user_mgt/screens/Loby/view/loby.dart';
import 'package:user_mgt/screens/detailes/provider/detailes_provider.dart';
import 'package:user_mgt/screens/home/provider/home_provider.dart';
import 'package:user_mgt/screens/home/view/home.dart';
import 'package:user_mgt/screens/signup.dart/provider/provider.dart';
 main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(
    MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (_)=>LoginSignup()),
    ChangeNotifierProvider(create: (_)=> HomeProvider()),
    ChangeNotifierProvider(create: (_)=>DetailesProvider())
  ],
  child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme:const TextTheme(headlineLarge: TextStyle(color: Colors.yellow)),
        inputDecorationTheme:const InputDecorationTheme(labelStyle: TextStyle(color: Colors.white),),
        
      ),
      home :const MainPage(),
    );     
  }
}

class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>
  StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
     if (snapshot.hasData) {
       return const Home();
     }
     else{
      return const LobyPage();
     }
  },);
}
