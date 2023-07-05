import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
    final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
            ),

              SizedBox(height: 20,), 

   Container(
                width: 200.w,
                height: 50,
                
                child: ElevatedButton(
                  onPressed: () {
                 _auth.sendPasswordResetEmail(email: email.text.toString()); 
                  },
                  child: Text(
                    "Forget",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}