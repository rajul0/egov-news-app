import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> ambilBeritaSpotlight() async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/feeds?limit=3&&page=1'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data["data"];
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List> ambilBeritaBaru() async {
  final response = await http.get(Uri.parse(
      'https://sinergi.bandaacehkota.go.id/api/feeds?limit=15&&page=1'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data["data"];
  } else {
    throw Exception('Failed to load data');
  }
}
