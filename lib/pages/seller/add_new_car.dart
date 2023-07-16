import 'dart:typed_data';

import 'package:auto/pages/seller/image_store_method.dart';
import 'package:auto/pages/seller/image_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCar extends StatefulWidget {
  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController rate = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController carname = TextEditingController();
  final TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Add New Car",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  selectImage();
                },
                child: Container(
                    alignment: Alignment.center,
                    child: _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 64.r,
                            backgroundImage: NetworkImage(
                                "https://as2.ftcdn.net/v2/jpg/01/35/19/77/1000_F_135197727_Ep1JMsgNKm1CZoJ1TEpipWKgZ8UKxc12.jpg"),
                          )),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: carname,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: model,
                decoration: InputDecoration(
                  labelText: "Car Model",
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
              SizedBox(height: 15.h),
              TextFormField(
                controller: rate,
                decoration: InputDecoration(
                  labelText: "Rate ",
                  labelStyle: TextStyle(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                  labelText: "Location..",
                  labelStyle: TextStyle(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    saveProfile();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Uint8List? _image;
  final picker = ImagePicker();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String resp = await StoreData().addNewCar(
        carname: carname.text.toString(),
        model: model.text.toString(),
        rate: rate.text.toString(),
        location: location.text.toString(),
        file: _image!);
  }



//   addData() {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
// ref.set({
//           'name': "Puteri",
//           'age': 18,
//           'faculty': "feculty of Engineering",
         
//         });
//   }
 
 update(){
  
  var collection = FirebaseFirestore.instance.collection('collection');
collection 
    .doc('some_id') 
    .update({'age' : '20', "faculty":'Faculty of computing'}) ;
 }
  

  CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> remove() {
  return users
    .doc('ABC123')
    .delete()
    .then((value) => print("User Deleted"))
    .catchError((error) => print("Failed to delete user: $error"));
}
}
