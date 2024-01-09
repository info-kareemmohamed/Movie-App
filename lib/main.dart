import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'features/home/screens/HomeScreen.dart';
// import 'firebase_options.dart';



Future<void> main() async {

 // await Firebase.initializeApp(
  //    options: DefaultFirebaseOptions.currentPlatform,);
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
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:HomeScreen(),

    );
  }
}
