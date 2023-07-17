import 'package:auto/pages/seller/car_details_page.dart';
import 'package:auto/pages/seller/edit_my_car.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_plus/share_plus.dart';

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
          title: Text("My Cars"),
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
                      height: 150.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          //
                          Container(
                            height: 120.h,
                            width: 80.w,
                            child: Image.network(
                                "${snapshot.data!.docs[index].get("url").toString()}"),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 160.w,
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
                                InkWell(
                                  onTap: () {
                                    Get.to(CarDetailsPage(),
                                        arguments: snapshot.data!.docs[index]);
                                  },
                                  child: Container(
                                    width: 50.w,
                                    padding: EdgeInsets.all(5),
                                    color: Colors.purple,
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 150.h,
                              width: 70.w,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(EditMyCar(),
                                            arguments:
                                                snapshot.data!.docs[index]);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20.h,
                                        color: Colors.purple,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("mycarList")
                                            .doc('RvKrth07G8eWegcirfpNT3z56ql1')
                                            .delete()
                                            .then((value) =>
                                                print("User Deleted"))
                                            .catchError((error) => print(
                                                "Failed to delete user: $error"));
                                        Get.snackbar("title",
                                            "Data successfully deleted",
                                            backgroundColor: Colors.deepOrange,
                                            colorText: Colors.white);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 20.h,
                                        color: Colors.purple,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  IconButton(
                                    onPressed: ()
                                    {
                                      print("object");
                                      //   Share.shareFiles(['${snapshot.data!.docs[index].get("rate")}']);
                                      Share.share(
                                          'check out my website https://example.com');
                                    },
                                  icon: Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  });
            }));
  }

  remove() {
    return FirebaseFirestore.instance
        .collection('mycarList')
        .doc('RvKrth07G8eWegcirfpNT3z56ql1')
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  delete() {
    FirebaseFirestore.instance.collection("chats").doc("ROOM_1").delete();
  }
}
