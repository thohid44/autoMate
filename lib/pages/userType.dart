import 'package:auto/pages/home/home.dart';
import 'package:auto/pages/seller/sellerHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  Home({this.user});
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('id', isEqualTo: user!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return checkRole(snapshot.data!.docs[0].get("userType"));
          }
        },
      ),
    );
  }

  checkRole( value) {
  
    print(value);
    if (value == 'seller') {
      return SellerHome();
    } else if (value == 'Buyer') {
      return HomePage();
    } else {}
  }
}

Center adminPage(DocumentSnapshot snapshot) {
  return Center(
    child: Text('${snapshot.get('userType')} ${snapshot.get('userType')}'),
  );
}

Center userPage(DocumentSnapshot snapshot) {
  return Center(
    child: Text(snapshot.get('userType')),
  );
}
