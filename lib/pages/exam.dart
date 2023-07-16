import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App ',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Container(
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Text 1"),
                     Text("Text 3")
                  ],
                ),
              ),
               Container(
                child: Column(
                  children: [
                   
                     Text("Text 3")
                  ],
                ),
              ),
               Container(
                child: Column(
                  children: [
                    Text("Text 4"),
                     Text("Text 5")
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
