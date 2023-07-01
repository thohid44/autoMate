import 'package:auto/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManager {

  Widget handleAuth() {
    return StreamBuilder(
    
      builder: (BuildContext context, snapshot) {
      return LoginPage();
    });
  }
}
