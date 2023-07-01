import 'package:auto/pages/buyer/views/al_ready_order_carList.dart';
import 'package:auto/pages/buyer/views/car_list_for_order.dart';
import 'package:auto/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool buttonColor1 = false;
  bool buttonColor2 = false;

  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.centerLeft,
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            padding: EdgeInsets.only(left: 8.h),
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              controller: search,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                hintText: "Search for a services",
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Container(
                  child: Text("Log Out"),
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
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.to(LoginPage());
                },
                child: Container(
                  child: Text("Log Out"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CarListForOrder());
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
                    "Rent a car",
                    style: TextStyle(
                        color: buttonColor1 ? Colors.white : Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AlReadyCarOrderList());
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
                    "My Ordered Car List",
                    style: TextStyle(
                        color: buttonColor2 ? Colors.white : Colors.black,
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
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w),
                  itemCount: 16,
                  itemBuilder: (cxt, index) {
                    return Container(
                      margin: EdgeInsets.all(10.w),
                      padding: EdgeInsets.all(8.w),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    "RM: 400/day",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                ),
                                Container(child: Icon(Icons.arrow_forward))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ]));
  }
}
