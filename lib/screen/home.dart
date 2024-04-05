

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: Image.asset('asset/Neflix app png.png',height: 30,width: 30,),
        backgroundColor: Colors.black,
      
        actions: [Icon(Icons.cast_connected_outlined), SizedBox(width: 20,),Icon(Icons.search), SizedBox(width: 10,)],
        
       ),
    );
  }
}
