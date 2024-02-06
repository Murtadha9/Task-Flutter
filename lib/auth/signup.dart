import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moor/components/textform.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

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
                const Text('Sign Up' ,style: TextStyle(fontSize: 30.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                
                const Text('Username',style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(hinttext: 'Enter Your Username', myController: username,abscure: false,),
                const SizedBox(height: 10,),

                const Text('Email',style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(hinttext: 'Enter Your Email', myController: email,abscure: false,),
                const SizedBox(height: 10,),
                const Text('Password',style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(hinttext: 'Enter Your Passwor', myController: password,abscure:true),
                const SizedBox(height: 30,),
               
              ],
            ),
            MaterialButton(
                  height: 50.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: ()async{
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text.trim(),
                        password: password.text.trim(),);
                        Navigator.of(context).pushReplacementNamed('home');
                      } on FirebaseAuthException catch (e) {
                     if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                     print('The account already exists for that email.');
                     }
                 } catch (e) {
                 print(e);
                   }
                  },
                  color: Colors.greenAccent,
                
                  child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 10,),
                  
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      const Text("Aleardy Have Account ? " ,style: TextStyle(fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed('login');
                        },
                        child: const Text("Login " ,style: TextStyle(color: Colors.green , fontSize: 18.0,fontWeight: FontWeight.bold), ),
                      )

                    ],
                  )
                  



          ],
        ),
      ),
    );
  }
}