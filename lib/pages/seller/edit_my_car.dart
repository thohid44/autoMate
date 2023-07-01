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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/car1.png"),
          ),

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
                    SizedBox(width: 15.w,),
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
          ElevatedButton(
            child: Text('Update'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          ),
        ],
      ),
    );
  }
}
