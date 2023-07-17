import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarOrderRecievePage extends StatefulWidget {
  const CarOrderRecievePage({super.key});

  @override
  State<CarOrderRecievePage> createState() => _CarOrderRecievePageState();
}

class _CarOrderRecievePageState extends State<CarOrderRecievePage> {
  var recievedData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Car Order Received "),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/car1.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
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
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        child: Text(
                          "${recievedData.get('car_name')}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
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
                      width: 40.w,
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
                      width: 50.w,
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
                      width: 20.w,
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
            height: 30.h,
          ),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {
                //      addNewCar(
                //         carname: recievedData.get('car_name'),
                //         model:  recievedData.get('model'),
                //         rate:  recievedData.get('rate'),
                //         location:  recievedData.get('location'),);
                // },
                addNewCar();
              },
              icon: Icon(Icons.shopping_cart),
              label: Text("Approved "),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
// {
//     required String carname,
//     required String model,
//     required String rate,
//     required String location,
//     required String sellerId,
//   }

  addNewCar() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      user = auth.currentUser;

      if (user!.uid != null) {
        FirebaseFirestore.instance.collection('order').add({
          'car_name': recievedData.get('car_name'),
          'model': recievedData.get('model'),
          'rate': recievedData.get('rate'),
          "location": recievedData.get('location'),
          "seller_id": recievedData.get('userId'),
          "buyer_id": user.uid.toString(),
        
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
