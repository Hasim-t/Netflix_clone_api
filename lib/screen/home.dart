
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix__clone/notifier.dart';
import 'package:netflix__clone/widgets/circlecontainer.dart';
import 'package:netflix__clone/widgets/populartv.dart';
import 'package:netflix__clone/widgets/topratedmovie.dart';
import 'package:netflix__clone/widgets/topratedtvshos.dart';
import 'package:netflix__clone/widgets/tranding.dart';
import 'package:netflix__clone/widgets/upcoming.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String apikey = '11125e936d1fe414914f02548edee9a8';
  String keyaccecetoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTEyNWU5MzZkMWZlNDE0OTE0ZjAyNTQ4ZWRlZTlhOCIsInN1YiI6IjY2MGNlNjE2OWM5N2JkMDEzMGEyY2Y5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-HMfn73kztbVL6l5BzlYeCxBDl_OdHuIE669HDdNtcM';
  
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Image.asset(
            'asset/Neflix app png.png',
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.black,
          actions: const [
            Icon(Icons.cast_connected_outlined),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Titless(text: 'Tv Show', size: 15),
                  SizedBox(
                    width: 15,
                  ),
                  Titless(text: 'Movies', size: 15),
                  SizedBox(
                    width: 15,
                  ),
                  Titless(text: 'Categories  ⬇', size: 15)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: trendingmovies.value.isNotEmpty
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${trendingmovies.value[0]['poster_path']}',
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 32,
                            bottom: 100,
                            child: Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.5)),
                              child: const Center(
                                child: Text(
                                  'Play ▶️',
                                  style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 39,
                            bottom: 100,
                            child: Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black38),
                              child: const Center(
                                child: Text(
                                  'My List ✔',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              TrandingMovies(tranding:trendingmovies.value ),
              TvShows(tvshows:  populartvshowsvalue.value),
              UpcomingMovies(upcoming: upcomingmoviesvalue.value),
              TopRatedMovies(topratedmoives: topratedmoviesvalue.value),
              TopRatedTvShows(topratedTvShows: topratedtvshowsvalue.value),
            ],
          ),
        ));
  }
}
