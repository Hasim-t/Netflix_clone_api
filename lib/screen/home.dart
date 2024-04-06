import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix__clone/widgets/circlecontainer.dart';
import 'package:netflix__clone/widgets/tranding.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String apikey = '11125e936d1fe414914f02548edee9a8';
  String keyaccecetoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTEyNWU5MzZkMWZlNDE0OTE0ZjAyNTQ4ZWRlZTlhOCIsInN1YiI6IjY2MGNlNjE2OWM5N2JkMDEzMGEyY2Y5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-HMfn73kztbVL6l5BzlYeCxBDl_OdHuIE669HDdNtcM';
  List tradingmovies = [];
  List topratedmovies = [];
  List tvshows = [];

  @override
  void initState() {
    // TODO: implement initState
    loadMove();
    super.initState();
  }

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
      body:SingleChildScrollView(
        child: Column(
          
          children: [
            
            const Row(
              children: [
                SizedBox(width: 15,),
                Titless(text:'Tv Show', size: 15),
              SizedBox(
                width: 15,
              ),
              Titless(text: 'Movies', size: 15),
              SizedBox(width: 15,),
              Titless(text: 'Categories  ⬇', size: 15)
              ],
            ),
           Stack(
             children: [
               Container(width: 20,
               height: 20,
               color: Colors.amber,
               child: Text('play'),
               ),
               
               Container(
                 height: 500,
                 width: 300,
                 child: tradingmovies.isNotEmpty
                     ? Image.network(
                         'https://image.tmdb.org/t/p/w500${tradingmovies[0]['poster_path']}',
                         fit: BoxFit.cover,
                         loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
                         },
                       )
                     : const Center(
                         child: CircularProgressIndicator(),
                       ),
               ),
             ],
           ),
            TrandingMovies(tranding: tradingmovies)
          ],
        ),
      )
    
    );
  }

  loadMove() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, keyaccecetoken),
        logConfig:  ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map tradingrusult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      tradingmovies = tradingrusult['results'];
      topratedmovies = topratedresults['results'];
      tvshows = tvresults['results'];
    });
    print(tradingrusult);
  }
}
