import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix__clone/utils/text.dart';

class TopRatedTvShows extends StatelessWidget {
  final List topratedTvShows;
  const TopRatedTvShows({super.key, required this.topratedTvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
              text: 'Top rated Tv Shows',
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
                  itemCount: topratedTvShows.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 140,
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              topratedTvShows[index]['poster_path']))),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
