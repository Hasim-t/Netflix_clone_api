// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix__clone/utils/text.dart';

class TrandingMovies extends StatelessWidget {
  final List tranding;
  const TrandingMovies({super.key, required this.tranding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
              text: 'Tranding movies',
              color: Colors.white,
              size: 22,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tranding.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: 140,
                        height: 200,
                        child: Column(
                          children: [
                          Container(
                             height: 200,
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(image: NetworkImage( 'https://image.tmdb.org/t/p/w500'+tranding[index]['poster_path']))
                             ),
                          )],
                        ),
                      )  ,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
