import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix__clone/utils/text.dart';


class TopRatedMovies extends StatelessWidget {
  final List topratedmoives;
  const TopRatedMovies({super.key, required this.topratedmoives});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
              text: 'Top Rated Movies',
              color: Colors.white,
              size: 22,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 320, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topratedmoives.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 180, 
                      
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${topratedmoives[index]['poster_path']}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}