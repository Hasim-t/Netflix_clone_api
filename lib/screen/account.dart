import 'package:flutter/material.dart';
import 'package:netflix__clone/notifier.dart';
import 'package:netflix__clone/services/api.dart';
import 'package:netflix__clone/widgets/populartv.dart';
import 'package:netflix__clone/widgets/topratedmovie.dart';
import 'package:netflix__clone/widgets/trailears.dart';
import 'package:netflix__clone/widgets/watchhistory.dart';


class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Netflix'),
        actions: [Icon(Icons.cast), SizedBox(width: 12,),IconButton(onPressed: (){}, icon: Icon(Icons.search)),SizedBox(width: 12,),Icon(Icons.menu_rounded)],
       ),

       body: SingleChildScrollView(
        child: Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 120,
              height: 150,
              decoration:  const BoxDecoration(
               
                borderRadius: BorderRadius.all(Radius.circular(12))
                
              ),
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset('asset/Screenshot_2024-04-07-12-13-46-026-edit_com.miui.gallery.jpg')),
            ),
            
          ),
        ),
         SizedBox(
      height: 40,
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
             children: [
               Row(
                children: [
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:  Colors.red
                     ),
                     child: Icon(Icons.notifications),
                     
                     
                   ),
  SizedBox( width: 12,),
               Text('Notifications', style: TextStyle( fontSize: 23,fontWeight: FontWeight.bold ), )
                ],
               ),
             Icon(Icons.arrow_forward_ios_outlined,size: 40,),
             
             ],
           ),
         ),
         SizedBox(
          height: 10,
         ),
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
             children: [
               Row(
                children: [
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:  Colors.blue
                     ),
                     child: Icon(Icons.download),
                     
                     
                   ),
  SizedBox( width: 12,),
               Text('Downloads', style: TextStyle( fontSize: 23,fontWeight: FontWeight.bold ), )
                ],
               ),
             Icon(Icons.arrow_forward_ios_outlined,size: 40,),
             
             ],
           ),
         ),
         WatchHistory(tranding: topratedmoviesvalue.value),
         Trialers(tranding:trendingmovies.value ),
         TvShows(tvshows: topratedtvshowsvalue.value)

          ],
        ),
       ),

    );
  }
}