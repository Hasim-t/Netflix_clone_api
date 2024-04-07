import 'package:flutter/material.dart';
import 'package:netflix__clone/services/api.dart';

class DisplayHotAndNews extends StatelessWidget {
  final List news;

  const DisplayHotAndNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topratedMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('error :${snapshot.error}');
        } else {
          // Check if the news list is not empty before rendering the ListView.builder
          if (news.isNotEmpty) {
            return Container(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${news[index]['poster_path']}',
                            width: double.infinity,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          news[index]['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          news[index]['overview'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }
      },
    );
  }
}