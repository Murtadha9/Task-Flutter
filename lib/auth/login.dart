import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moor/components/textform.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();



  
Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if(googleUser == null){
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 90.0,
                    height: 90.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Image.asset('images/1.png',height: 70.0,),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Log In' ,style: TextStyle(fontSize: 30.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text('Email',style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(hinttext: 'Enter Your Email', myController: email,abscure: false,),
                const SizedBox(height: 10,),
                const Text('Password',style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(hinttext: 'Enter Your Passwor', myController: password,abscure:true),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text('Forget the Password ?',style: TextStyle(fontSize: 14),)),
                  const SizedBox(height: 10,),
                  


              ],
            ),
            MaterialButton(
                  height: 50.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: ()async{
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text.trim(),
                      password: password.text.trim()
                       );
                     Navigator.of(context).pushReplacementNamed('home');
                     } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('user-not-found');
                     
                   } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                      

                         }
                         }
                  },
                  color: Colors.greenAccent,
                  child: const Text('Login'),
                  ),
                  const SizedBox(height: 30,),
                  const Text('or Login with ' ,style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  Container(
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        MaterialButton(
                  height: 50.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: (){
                    signInWithGoogle();
                  },
                  color: Colors.grey[200],
                  textColor: Colors.white,
                  child: Image.asset('images/2.png',height: 30.0,),
                  ),
                  const SizedBox(width: 10,),
                  MaterialButton(
                  height: 50.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: (){},
                  color: Colors.grey[200],
                  textColor: Colors.white,
                  child: Image.asset('images/3.png',height: 30.0,),
                  ),
                      ],
                    ),
                    
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      const Text("Don't Have Account ? " ,style: TextStyle(fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed('signup');
                        },
                        child: const Text("Register " ,style: TextStyle(color: Colors.green , fontSize: 18.0,fontWeight: FontWeight.bold), ),
                      )

                    ],
                  )
                  



          ],
        ),
      ),
    );
  }
}


  
