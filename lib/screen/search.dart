import 'package:flutter/material.dart';
import 'package:netflix__clone/notifier.dart';

import 'package:netflix__clone/services/api.dart';
import 'package:netflix__clone/services/deboouncer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Deboucer _deboucer = Deboucer(millisecond: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _deboucer.run(() {
                  searchfututer(value);
                });
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                hintText: "Search Movies & TV shows",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ValueListenableBuilder<List<dynamic>>(
                valueListenable: searchmovies,
                builder: (context, searchResults, _) {
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = searchResults[index];
                      final posterPath = movie['poster_path'];
                      final title = movie['title'];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 200,
                          margin: const EdgeInsets.only(bottom: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500$posterPath',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
