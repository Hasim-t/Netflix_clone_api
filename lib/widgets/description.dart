// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Descriptions extends StatefulWidget {
  const Descriptions({super.key});

  @override
  State<Descriptions> createState() => _DescriptionState();
}

class _DescriptionState extends State<Descriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search
        ,color: Colors.white,
        ))],
        backgroundColor: Colors.black,
    
      ),
          backgroundColor: Colors.black,
          body:   Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: Text('hi'),
              ),
             const Row(
                children: [
                  Text('tittle',style: TextStyle(
                    fontSize: 35,color: Color.fromARGB(255, 255, 255, 255)
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(child: Text('▶ Play',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),)),
                decoration: BoxDecoration(
    
                  color: const Color.fromARGB(183, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)
                ),
                height: 60,
                width: MediaQuery.of(context).size.width,
                
              ),
             
              SizedBox(height: 10,),
              Container(
                child: Center(child: Text('⬇Download',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),)),
                decoration: BoxDecoration(
    
                  color: Color.fromARGB(183, 81, 76, 76),
                  borderRadius: BorderRadius.circular(12)
                ),
                height: 60,
                width: MediaQuery.of(context).size.width,
                
              ),
              SizedBox(
                height: 10,
              ),
              Text('follow the mythic journey of paul Aterders as he unites with Chani and the Fremaen while on a path of revenge against the conspirators who destroyed his family Facing a choice between the love of his life and the fate of the known univrse Paul endaavors to prevent a terrible future only he can foresee', style: TextStyle(
                color: Colors.white
              ),),
             const SizedBox(height: 25,),
             const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 40,),
                    Icon(Icons.thumb_up,color: Colors.white,size: 40,),
                    Icon(Icons.share,color: Colors.white,size: 40,),
                  
                  ],
                ),
              )
            ],
            
          ),
    );
  }
}