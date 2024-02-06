import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController myController;
  final bool abscure;
  
  const TextForm({super.key, required this.hinttext, required this.myController, required this.abscure });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: myController,
                  obscureText: abscure,
                  decoration: InputDecoration(
                    hintText: hinttext,
                    hintStyle: const TextStyle(fontSize: 14.0 , color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey)
                      ),
                      enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey)
                      ),
                    
                  ),

                );
  }
}