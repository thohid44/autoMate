import 'package:auto/pages/seller/add_new_car.dart';
import 'package:auto/pages/buyer/views/car_list_for_order.dart';
import 'package:auto/pages/seller/my_car_list_page.dart';
import 'package:auto/pages/seller/car_order_Recieve_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  bool buttonColor1 = false;
  bool buttonColor2 = false;
  final auth = FirebaseAuth.instance;
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          automaticallyImplyLeading: false,
          title: Text("Seller DashBoard"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Container(
                  child: Text("Log Out",style: TextStyle(fontSize: 15.sp, color: Colors.black),),
                ),
              )
            ],
          ),
        ),
        body: ListView(children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(CarListPage());
                  setState(() {
                    buttonColor2 = true;
                    buttonColor1 = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5.w),
                      color: buttonColor2 ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    "My car List",
                    style: TextStyle(
                        color: buttonColor2 ? Colors.white : Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AddNewCar());
                  setState(() {
                    buttonColor1 = true;
                    buttonColor2 = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      color: buttonColor1 ? Colors.black : Colors.white,
                      border: Border.all(width: 0.5.w),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    "Add New Car",
                    style: TextStyle(
                        color: buttonColor1 ? Colors.white : Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              height: 600.h,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("order")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (cxt, index) {
                          return Container(
                            margin: EdgeInsets.all(10.w),
                            padding: EdgeInsets.all(8.w),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(CarOrderRecievePage(),
                                    arguments: snapshot.data!.docs[index]);
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/car1.png"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Text(
                                        "Sportback RS 5",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Status: Pending",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black54),
                                          ),
                                        ),
                                        Container(
                                            child: Icon(Icons.arrow_forward))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }))
        ]));
  }
}
