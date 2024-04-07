// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:netflix__clone/services/api.dart';
import 'package:netflix__clone/utils/text.dart';
import 'package:netflix__clone/widgets/description.dart';

class Trialers extends StatelessWidget {
  final List tranding;
  const Trialers({super.key, required this.tranding});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ass(),
      builder: (context, snapshot) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                  text: "Trailers You've Watched",
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tranding.length,
                    itemBuilder: (context, index) {
                      final title = tranding[index]['title'] as String?;
                      final posterPath = tranding[index]['backdrop_path'] as String?;
                      final overview = tranding[index]['overview'] as String?;
                      if (title == null || posterPath == null || overview == null) {
                        return SizedBox.shrink();
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Descriptions(
                                titles: title,
                                posterurl: 'https://image.tmdb.org/t/p/w500' + posterPath,
                                description: overview,
                              );
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              width: 300,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' + posterPath,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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