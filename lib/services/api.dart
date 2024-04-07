import "dart:convert";

import "package:http/http.dart" as http;
import "package:netflix__clone/notifier.dart";

String apikey = '11125e936d1fe414914f02548edee9a8';
String keyaccecetoken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTEyNWU5MzZkMWZlNDE0OTE0ZjAyNTQ4ZWRlZTlhOCIsInN1YiI6IjY2MGNlNjE2OWM5N2JkMDEzMGEyY2Y5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-HMfn73kztbVL6l5BzlYeCxBDl_OdHuIE669HDdNtcM';

Future<void> trendingmoviess() async {
  try {
    final url =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      trendingmovies.value = items['results'];
      print(trendingmovies);
    }
  } catch (e) {
    print(e);
  }
}

Future<void> topratedtvshoesss() async {
  try {
    final url = 'https://api.themoviedb.org/3/trending/tv/day?api_key=$apikey';
    final uri = Uri.parse(url);
    final resposnce = await http.get(uri);
    if (resposnce.statusCode == 200) {
      final body = resposnce.body;
      final item = jsonDecode(body);
      topratedtvshowsvalue.value = item['results'];
    }
  } catch (e) {
    print(e);
  }
}

Future<void> topratedMovies() async {
  try {
    final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey';
    final uri = Uri.parse(url);
    final resposnce = await http.get(uri);
    if (resposnce.statusCode == 200) {
      final body = resposnce.body;
      final item = jsonDecode(body);
      topratedmoviesvalue.value = item['results'];
    }
  } catch (e) {
    print(e);
  }
}

Future<void> upcomingMoviesFu() async {
  try {
    final url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    if (responce.statusCode == 200) {
      final body = responce.body;
      final item = jsonDecode(body);
      upcomingmoviesvalue.value = item['results'];
    }
  } catch (e) {
    print(e);
  }
}

Future<void> popularmoviesfutere() async {
  try {
    final url = 'https://api.themoviedb.org/3/tv/popular?api_key=$apikey';
    final uri = Uri.parse(url);
    final resposnce = await http.get(uri);
    if (resposnce.statusCode == 200) {
      final body = resposnce.body;
      final item = jsonDecode(body);
      populartvshowsvalue.value = item['results'];
    }
  } catch (e) {
    print(e);
  }
}

Future<void> searchfututer(String quary) async {
  isloading.value = true;
  final url =
      'https://api.themoviedb.org/3/search/movie?query=$quary&api_key=$apikey';
  final uri = Uri.parse(url);
  final responce = await http.get(uri);
  if (responce.statusCode == 200) {
    final body = responce.body;
    final item = jsonDecode(body);
    searchmovies.value = item['results'];
    searchmovies.notifyListeners();
    isloading.value = false;
    isloading.notifyListeners();
  }
}
