import 'package:auto/pages/seller/car_details_page.dart';
import 'package:auto/pages/seller/edit_my_car.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var userId;
  User? user;
  void initState() {
    user = auth.currentUser;
    userId = user!.uid;
    print("user id $userId"); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purpleAccent,
          title: Text("My Car"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("mycarList")
                .where("userId", isEqualTo: userId)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          //
                          Container(
                            height: 100.h,
                            width: 80.w,
                            child: Image.network("${snapshot.data!.docs[index].get("url").toString()}"),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Container(
                            width: 170.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: Text(
                                    "Name: ${snapshot.data!.docs[index].get("car_name").toString()}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Model: ${snapshot.data!.docs[index].get("model")}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Location: ${snapshot.data!.docs[index].get("location")}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Ringgit/day: ${snapshot.data!.docs[index].get("rate")}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100.h,
                            child: IconButton(
                                onPressed: () {
                                  Get.to(EditMyCar(),
                                      arguments: snapshot.data!.docs[index]);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.purple,
                                )),
                          )
                        ],
                      ),
                    );
                  });
            }));
  }


// void readDataOnce() {
//   final databaseReference = FirebaseDatabase.instance.reference();
  
//   databaseReference.once().then((DataSnapshot snapshot) {
//     print(snapshot.value);
//   }).catchError((error) {
//     print('Failed to read data: $error');
//   });
// }


// void checkPostExists(String postRef) async{
//   final databaseReference = await FirebaseDatabase.instance.reference().child(postRef);

//   databaseReference.once().then((DataSnapshot snapshot) {
//     if (snapshot.value != null) {
//       print('Post exists.');
//     } else {
//       print('Post does not exist.');
//     }
//   }).catchError((error) {
//     print('Failed to read data: $error');
//   });
// }


// void newData(String data) {
//   final databaseReference = FirebaseDatabase.instance.reference();

//   databaseReference.set(data).then((_) {
   
//     databaseReference.once().then((DataSnapshot snapshot) {
//       print('New data: ${snapshot.value}');
//     }).catchError((error) {
//       print('Failed to read data: $error');
//     });
//   }).catchError((error) {
//     print('Failed to write data: $error');
//   });
// }

}


