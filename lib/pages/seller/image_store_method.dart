import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName,Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

 
    addNewCar({
    required String carname,
    required String model,
    required String rate,
    required String location,
    required Uint8List file,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      user = auth.currentUser;
   String imageUrl = await uploadImageToStorage('cars', file);
      if (user!.uid != null) {
        var id = user.uid.toString();
        FirebaseFirestore.instance.collection('mycarList').doc(id).set({
           
          'car_name': carname,
          'model': model,
          'rate': rate,
          "location": location,
           "id":id, 
          "userId": user.uid.toString(),
          'url':imageUrl.toString()
        });

        Get.snackbar("Message", "Car Successfully stored"); 
      }
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      print(e);
    }
    return user;
  }
}