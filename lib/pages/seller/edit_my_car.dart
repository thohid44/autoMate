import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditMyCar extends StatefulWidget {
  const EditMyCar({super.key});

  @override
  State<EditMyCar> createState() => _EditMyCarState();
}

class _EditMyCarState extends State<EditMyCar> {
  var recievedData = Get.arguments;
  final TextEditingController carname = TextEditingController();
  final TextEditingController rate = TextEditingController();
  final TextEditingController model = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Car Update"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            child: Container(
              padding: EdgeInsets.only(top: 10.h),
              height: 200.h,
              child: Image.network("${recievedData.get('url')}"),
            ),
          ),
          SizedBox(height: 15.w),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Car Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      width: 150,
                      height: 50.h,
                      child: TextFormField(
                        controller: carname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "${recievedData.get('car_name')}"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Model",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      child: Text(
                        "${recievedData.get('model')}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Rate",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      child: Text(
                        "${recievedData.get('rate')}/day",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      child: Text(
                        "${recievedData.get('location')}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            child: Text(
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("mycarList")
                  .doc('RvKrth07G8eWegcirfpNT3z56ql1')
                  .update({"car_name": carname.text.toString()});
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          ),
        ],
      ),
    );
  }
}



// CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<void> updateUser() {
//   return users
//     .doc('ABC123')
//     .update({'company': 'Stokes and Sons'})
//     .then((value) => print("User Updated"))
//     .catchError((error) => print("Failed to update user: $error"));
// }