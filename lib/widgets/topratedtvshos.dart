// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:netflix__clone/services/api.dart';

import 'package:netflix__clone/utils/text.dart';
import 'package:netflix__clone/widgets/description.dart';

class TopRatedTvShows extends StatelessWidget {
  final List topratedTvShows;
  const TopRatedTvShows({super.key, required this.topratedTvShows});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topratedtvshoesss(),
      builder: (context, snapshot) {
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
                  height: 216,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topratedTvShows.length,
                    itemBuilder: (context, index) {
                      final title = topratedTvShows[index]['name'] as String?;
                      final posterPath =
                          topratedTvShows[index]['poster_path'] as String?;
                      final overview =
                          topratedTvShows[index]['overview'] as String?;

                      if (title == null ||
                          posterPath == null ||
                          overview == null) {
                        return SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Descriptions(
                                titles: title,
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    posterPath,
                                description: overview,
                              );
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                            posterPath,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      },
    );
  }
}
