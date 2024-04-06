import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Titless extends StatelessWidget {
  final String text;
  final double size;
  

  const Titless({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      onTap: () {
        
      },
      child: Container(
      
         
        decoration:  BoxDecoration(
       border: Border.all(
      
        color: Colors.white,
        width: 2
       ),
          borderRadius: BorderRadius.all(
          
            Radius.circular(
              30))),
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: Text(
          text,
          style: TextStyle(fontSize: size),
        ),
      ),
    );
  }
}
