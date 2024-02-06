import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: MaterialButton(
            
                  height: 50.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: ()async{
                 await FirebaseAuth.instance.signOut();
                 Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);

                 GoogleSignIn signOut=GoogleSignIn();
                 signOut.disconnect();
                 },
                  color: Colors.red[400],
                  textColor: Colors.white,
                  child: const Text('Sign Out'),
                  ),
          )

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to', style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold ,color: Colors.blue),),
            const SizedBox(height: 20.0,),
          Container(
                    alignment: Alignment.center,
                    width: 120.0,
                    height: 120.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Image.asset('images/1.png',height: 100.0,),
                  ),
          ],
        ),
        ),
    );
  }
}