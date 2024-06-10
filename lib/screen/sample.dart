import "package:http/http.dart" as http;

Future<void> sample() async {
  final body = {"key": "value", "jjgi": "hello", "123": "322"};

  final url = "apikey";
  final uri = Uri.parse(url);

  final resposne = await http.post(uri, body: body);
  if (resposne.statusCode == 200) {
    print('its succus');
  } else {
    print('fail');
  }
}
