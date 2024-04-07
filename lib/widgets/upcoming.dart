import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix__clone/services/api.dart';
import 'package:netflix__clone/utils/text.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  const UpcomingMovies({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcomingMoviesFu(),
      builder: (context, snapshot) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CoustomText(
                  text: 'Upcoming Movies',
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upcoming.length,
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
                                                  upcoming[index]
                                                      ['poster_path']))),
                                ),
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
      },
    );
  }
}
