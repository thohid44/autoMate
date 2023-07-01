

import 'package:auto/pages/buyer/views/car_order_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarListForOrder extends StatefulWidget {
  const CarListForOrder({super.key});

  @override
  State<CarListForOrder> createState() => _CarListForOrderState();
}

class _CarListForOrderState extends State<CarListForOrder> {
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
          title: Text("Available Cars For Order"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("mycarList")
              
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
                            child: Image.asset("assets/car1.png"),
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
                                  Get.to(CarOrderPage(),
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
}