// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';



class Descriptions extends StatefulWidget {
  final String titles, posterurl, description;
  const Descriptions({super.key,  required this.posterurl, required this.description, required this.titles,});
  
  @override
  State<Descriptions> createState() => _DescriptionState();
}

class _DescriptionState extends State<Descriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Image(image: NetworkImage(widget.posterurl),
            fit: BoxFit.contain,
            ),
          ),
           Row(
            children: [
              Text(widget.titles
                 ,
              overflow: TextOverflow.fade,
              maxLines: 1,
           
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
                child: Text(
              '▶ Play',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
            decoration: BoxDecoration(
                color: const Color.fromARGB(183, 255, 255, 255),
                borderRadius: BorderRadius.circular(12)),
            height: 60,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
                child: Text(
              '⬇Download',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
            decoration: BoxDecoration(
                color: Color.fromARGB(183, 81, 76, 76),
                borderRadius: BorderRadius.circular(12)),
            height: 60,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           widget.description,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
                Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 40,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
