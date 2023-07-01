import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
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
          child: ElevatedButton.icon(
            
            onPressed: (){

          }, icon: Icon(Icons.shopping_cart), label:Text("Booking Now")),
         )
        ],
      ),
    ); 
  }
}
