import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moor/Home.dart';
import 'package:moor/auth/login.dart';
import 'package:moor/auth/signup.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Platform.isAndroid?await Firebase.initializeApp(
      options:const FirebaseOptions(
        apiKey: 'AIzaSyBmJvtv7WAEm6vKmiuCGXy-hVU0--meT9o',
        appId: '1:896383308783:android:0c1794561d939c06b79c1a',
        messagingSenderId: '896383308783',
        projectId: 'moor-dc07f',
        
        
      )
  ):await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

   @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:FirebaseAuth.instance.currentUser == null? const LoginScreen():const Home(),
       routes: {
        'home':(context)=> const Home(),
        'signup':(context)=> const SignUpScreen(),
        'login':(context)=> const LoginScreen()
      },
    );
  }
}
