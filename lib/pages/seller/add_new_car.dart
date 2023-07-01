import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              Text(
                "Add New Car",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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
                    addNewCar(
                        carname: carname.text.toString(),
                        model: model.text.toString(),
                        rate: rate.text.toString(),
                        location: location.text.toString());
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

  addNewCar({
    required String carname,
    required String model,
    required String rate,
    required String location,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      user = auth.currentUser;

      if (user!.uid != null) {
        FirebaseFirestore.instance.collection('mycarList').add({
          'car_name': carname,
          'model': model,
          'rate': rate,
          "location": location,
          "userId": user.uid.toString(),
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
