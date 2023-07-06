import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  var recievedData = Get.arguments; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Car Details"), 
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
             
                      child: Text("Car Name", 
                      style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      child: Text("${recievedData.get('car_name')}", 
                      style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,), 
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                      child: Text("Model", 
                      style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 15.w,),
                    Container(
                      child: Text("${recievedData.get('model')}", 
                      style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                 SizedBox(height: 10.h,), 
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                      child: Text("Rate", 
                      style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 15.w,),
                    Container(
                      child: Text("${recievedData.get('rate')}/day", 
                      style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                 SizedBox(height: 10.h,), 
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                      child: Text("Location", 
                      style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 15.w,),
                    Container(
                      child: Text("${recievedData.get('location')}", 
                      style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ],
            ),
          ), 
          SizedBox(height: 20.h,), 
     
        ],
      ),
    );
  }
}



// FirebaseFirestore.instance
//     .collection("users")
//     .doc("frank")
//     .update({"age": 13, "favorites.color": "Red"});